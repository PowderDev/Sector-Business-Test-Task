import { config } from 'dotenv';

config();

const keys = {
  PORT: process.env.PORT,
  JWT_ACCESS_SECRET: process.env.JWT_ACCESS_SECRET,
  JWT_REFRESH_SECRET: process.env.JWT_REFRESH_SECRET,
  BASE_URL: process.env.BASE_URL,
};

export default keys;
