import { Router } from 'express';
import { body } from 'express-validator';
import AuthController from '../controllers/authController';
const router = Router();

router.post(
  '/registration',
  body('email').isEmail(),
  body('password').isLength({ min: 5, max: 25 }),
  body('firstName').isLength({ min: 1, max: 25 }),
  AuthController.registration,
);
router.post('/login', AuthController.login);
router.post('/logout', AuthController.logout);

export default router;
