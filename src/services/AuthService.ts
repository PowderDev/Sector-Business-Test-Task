import bcrypt from 'bcryptjs';
import tokenService from './TokenService';
import ApiError from '../exceptions/ApiError';
import prisma from '../prisma';
import { User } from '@prisma/client';

class UserService {
  async register(firstName: string, email: string, password: string) {
    const candidate = await prisma.user.findFirst({ where: { email } });
    if (candidate) {
      throw ApiError.BadRequest('User with this email already exists');
    }

    const hashedPassword = await bcrypt.hash(password, 3);

    const user = await prisma.user.create({
      data: {
        firstName,
        email,
        password: hashedPassword,
      },
    });

    return this.generateTokens(user.id);
  }

  async login(email: string, password: string) {
    const candidate = await prisma.user.findFirst({ where: { email } });

    if (!candidate) {
      throw ApiError.NotFound('User with this email does not exist');
    }

    const isPassEquals = await bcrypt.compare(password, candidate.password);
    if (!isPassEquals) {
      throw ApiError.Unauthorized('Invalid password');
    }

    return this.generateTokens(candidate.id);
  }

  async logout(refreshToken: string) {
    await tokenService.removeToken(refreshToken);
  }

  async refresh(refreshToken: string) {
    if (!refreshToken) {
      throw ApiError.Unauthorized('Refresh token is not provided');
    }

    const userData = tokenService.validateRefreshToken(refreshToken);
    const tokenFromDb = await tokenService.findToken(refreshToken);

    if (!userData || !tokenFromDb) {
      throw ApiError.Unauthorized('Refresh token is invalid');
    }

    return this.generateTokens(userData.id);
  }

  async generateTokens(userId: User['id']) {
    const tokens = await tokenService.generateTokens({ id: userId });
    await tokenService.saveToken(userId, tokens.refreshToken);

    return tokens;
  }
}

export default new UserService();
