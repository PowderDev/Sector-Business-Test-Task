import { NextFunction, Request, Response } from 'express';
import ApiError from '../exceptions/ApiError';
import usePagination from '../helpers/usePagination';
import UserService from '../services/UserService';

class UserController {
  async getUsers(req: Request, res: Response, next: NextFunction) {
    try {
      const { page, take } = usePagination(req.query);
      const users = await UserService.getAllUsers(page, take);
      res.json(users);
    } catch (err) {
      next(err);
    }
  }

  getUser = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const id = this.checkIdParam(req.params.id);
      const user = await UserService.getUserById(id);
      res.json(user);
    } catch (err) {
      next(err);
    }
  };

  updateUser = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const id = this.checkIdParam(req.params.id);

      let photoPath: string | undefined;

      if (req.files) {
        const file = req.files.photo as any;
        const ext = file.mimetype.split('/')[1];
        const hash = (Math.random() + 1).toString(16) + '.' + ext;
        photoPath = '/upload/' + hash;
        file.mv(`./src/upload/${hash}`);
      }

      const data = {
        ...req.body,
        photo: photoPath,
      };

      const user = await UserService.updateUser(id, data);
      res.json(user);
    } catch (err) {
      next(err);
    }
  };

  checkIdParam(id: number | string) {
    id = Number(id);

    if (Number.isNaN(id)) {
      throw ApiError.BadRequest('Id is invalid');
    }

    return id;
  }
}

export default new UserController();
