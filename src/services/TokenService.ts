import jwt from 'jsonwebtoken';
import keys from '../keys';
import prisma from '../prisma';
import UserJWTData from '../types/user/UserJWTData';

class TokenService {
  REFRESH_TOKEN_MAX_AGE = 30 * 24 * 60 * 60 * 1000;

  async generateTokens(payload: UserJWTData) {
    const accessToken = jwt.sign(payload, keys.JWT_ACCESS_SECRET, {
      expiresIn: '30m',
    });
    const refreshToken = jwt.sign(payload, keys.JWT_REFRESH_SECRET, {
      expiresIn: '30d',
    });

    return {
      accessToken,
      refreshToken,
    };
  }

  async saveToken(userId: number, refreshToken: string) {
    const tokenData = await prisma.token.findFirst({ where: { userId } });

    if (tokenData) {
      tokenData.refreshToken = refreshToken;
      return await prisma.token.update({
        data: { refreshToken },
        where: { id: tokenData.id },
      });
    }

    return await prisma.token.create({
      data: { userId, refreshToken },
    });
  }

  async removeToken(refreshToken: string) {
    await prisma.token.delete({ where: { refreshToken } });
  }

  validateAccessToken(token: string) {
    try {
      const userData = jwt.verify(token, keys.JWT_ACCESS_SECRET);
      return userData as UserJWTData;
    } catch (err) {
      return null;
    }
  }

  validateRefreshToken(token: string) {
    try {
      const userData = jwt.verify(token, keys.JWT_REFRESH_SECRET);
      return userData as UserJWTData;
    } catch (err) {
      return null;
    }
  }

  async findToken(refreshToken: string) {
    return await prisma.token.delete({ where: { refreshToken } });
  }
}

export default new TokenService();
