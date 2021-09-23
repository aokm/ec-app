import React, { useEffect, useReducer } from 'react';
import { fetchShops } from '../api/shop';
import { initialState, shopActionType, shopReducer } from '../reducers/shop';

export const Shops = () => {
  const [state, dispatch] = useReducer(shopReducer, initialState);

  useEffect(() => {
    dispatch({ type: shopActionType.FETCHING });
    fetchShops().then((data) =>
      dispatch({
        type: shopActionType.FETCH_SUCCESS,
        payload: {
          shops: data.shops,
        },
      })
    );
  }, []);
  return (
    <>
      <h1>ショップ一覧</h1>
      {state.shopList.map((shop) => (
        <div key={shop.id}>{shop.name}</div>
      ))}
    </>
  );
};
