import axios from 'axios';
import { shops } from '../url/index';

export const fetchShops = async () => {
  try {
    const res = await axios.get(shops);
    return res.data;
  } catch (e) {
    return console.error(e);
  }
};
