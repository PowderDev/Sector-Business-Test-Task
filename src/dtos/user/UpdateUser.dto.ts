import { Sex } from '@prisma/client';

export default interface UpdateUserDto {
  photo?: string;
  sex?: Sex;
  firstName?: string;
  lastName?: string;
  email?: string;
}
