const DEFAULT_API_LOCALHOST = 'http://localhost:3000';

export const shops = `${DEFAULT_API_LOCALHOST}/shops`;
export const items = (shopId) => `${DEFAULT_API_LOCALHOST}/shop/${shopId}/items`;
export const tempOrder = `${DEFAULT_API_LOCALHOST}/temp_orders`;
export const tempOrdersReplace = `${DEFAULT_API_LOCALHOST}/temp_orders/replace`;
export const order = `${DEFAULT_API_LOCALHOST}/order`;
