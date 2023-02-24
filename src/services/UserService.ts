import UpdateUserDto from '../dtos/user/UpdateUser.dto';
import ApiError from '../exceptions/ApiError';
import prisma from '../prisma';

function excludeField<User, Key extends keyof User>(
  user: User,
  key: Key,
): Omit<User, Key> {
  delete user[key];
  return user;
}

class UserService {
  async getUserById(id: number) {
    const user = await prisma.user.findFirst({ where: { id } });

    if (!user) {
      throw ApiError.NotFound('User not found');
    }

    const userWithoutPassword = excludeField(user, 'password');
    return userWithoutPassword;
  }

  async updateUser(id: number, data: UpdateUserDto) {
    const user = await prisma.user.update({ where: { id }, data });

    if (!user) {
      throw ApiError.NotFound('User not found');
    }

    const userWithoutPassword = excludeField(user, 'password');
    return userWithoutPassword;
  }

  async getAllUsers(page = 1, take = 2) {
    const skip = (page - 1) * take;

    //! Prisma does not allow to do it any other way
    const [count, users] = await prisma.$transaction([
      prisma.user.count(),
      prisma.user.findMany({
        skip,
        take,
        orderBy: {
          createdAt: 'asc',
        },
      }),
    ]);

    const result = {
      results: users.map((u) => excludeField(u, 'password')),
      totalCount: count,
      currentPage: page,
      totalPages: Math.ceil(count / take),
    };

    return result;
  }
}

export default new UserService();
