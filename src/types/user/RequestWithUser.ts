import { Request } from 'express';
import UserJWTData from './UserJWTData';

type RequestWithUser = Request & { user?: UserJWTData };
export default RequestWithUser;
