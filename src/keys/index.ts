import devKeys from './dev';
import prodKeys from './prod';

let keys = devKeys;

if (process.env.NODE_ENV == 'production') {
  //@ts-expect-error: Unreachable error
  keys = prodKeys;
}

export default keys;
