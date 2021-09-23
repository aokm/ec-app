import { REQUEST_STATE } from '../constants/constants';

export const initialState = {
  fetchState: REQUEST_STATE.INITIAL,
  shopList: [],
};

export const shopActionType = {
  FETCHING: 'FETCHING',
  FETCH_SUCCESS: 'FETCH_SUCCESS',
};

export const shopReducer = (state, action) => {
  switch (action.type) {
    case shopActionType.FETCHING:
      return {
        ...state,
        fetchState: REQUEST_STATE.LOADING,
      };
    case shopActionType.FETCH_SUCCESS:
      return {
        fetchState: REQUEST_STATE.OK,
        shopList: action.payload.shops,
      };
    default:
      throw new Error();
  }
};
