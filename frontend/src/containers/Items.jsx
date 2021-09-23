import React from 'react';

export const Items = ({
  match: {
    params: { id },
  },
}) => {
  return (
    <>
      <h1>商品一覧</h1>
      <p>shop_idは {id} です</p>
    </>
  );
};
