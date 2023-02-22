import AuthService from '../services/AuthService';
import { NextFunction, Request, Response } from 'express';
import TokenService from '../services/TokenService';

class AuthController {
  registration = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { email, password, firstName } = req.body;
      const { accessToken, refreshToken } = await AuthService.register(
        firstName,
        email,
        password,
      );

      this.setRefreshToken(res, refreshToken);

      return res.json({ accessToken });
    } catch (err) {
      return next(err);
    }
  };

  login = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { email, password } = req.body;
      const { accessToken, refreshToken } = await AuthService.login(
        email,
        password,
      );

      this.setRefreshToken(res, refreshToken);

      return res.json({ accessToken });
    } catch (err) {
      next(err);
    }
  };

  async logout(req: Request, res: Response, next: NextFunction) {
    try {
      const { refreshToken } = req.cookies;
      await AuthService.logout(refreshToken);

      res.clearCookie('refreshToken');

      return res.json({ success: true });
    } catch (err) {
      next(err);
    }
  }

  refresh = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { refreshToken } = req.cookies;
      const userData = await AuthService.refresh(refreshToken);

      this.setRefreshToken(res, refreshToken);

      return res.json(userData);
    } catch (err) {
      next(err);
    }
  };

  setRefreshToken(res: Response, refreshToken: string) {
    res.cookie('refreshToken', refreshToken, {
      maxAge: TokenService.REFRESH_TOKEN_MAX_AGE,
      httpOnly: true,
    });
  }
}

export default new AuthController();
