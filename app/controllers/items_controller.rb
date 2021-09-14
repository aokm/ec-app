class ItemsController < ApplicationController
  def index
    items = Item.where(shop_id: params[:shop_id])

    render json: {
      items: items
    }, status: :ok
  end
end
