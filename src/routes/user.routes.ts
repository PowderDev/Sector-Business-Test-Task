import { Router } from 'express';
import fileUpload from 'express-fileupload';
import UserController from '../controllers/userController';
const router = Router();

router.get('/users', UserController.getUsers);
router.get('/users/:id', UserController.getUser);
router.post(
  '/users/update/:id',
  fileUpload({
    createParentPath: true,
    limits: { fileSize: 10 * 1024 * 1024 },
  }),
  UserController.updateUser,
);

export default router;
