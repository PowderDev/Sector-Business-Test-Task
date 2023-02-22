import express from 'express';
import cookieParser from 'cookie-parser';
import keys from './keys';
import errorCatcher from './middlewares/errorCatcher';
import prisma from './prisma';
import authRoutes from './routes/auth.routes';
import userRoutes from './routes/user.routes';
import { join } from 'node:path';

const app = express();

app.use(express.json());

app.use(cookieParser());

app.use('/upload', express.static(join('.', 'upload')));
app.use('/api', authRoutes);
app.use('/api', userRoutes);

app.use(errorCatcher);

app.listen(keys.PORT, () =>
  console.log(`Server running on port: ${keys.PORT}`),
);

process.on('exit', () => {
  prisma.$disconnect();
});
