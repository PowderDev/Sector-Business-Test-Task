import { config } from 'dotenv';
import Keys from '../types/keys';

config();

const keys: Keys = {
  PORT: process.env.PORT,
  JWT_ACCESS_SECRET: process.env.JWT_ACCESS_SECRET,
  JWT_REFRESH_SECRET: process.env.JWT_REFRESH_SECRET,
  BASE_URL: process.env.BASE_URL,
};

export default keys;
