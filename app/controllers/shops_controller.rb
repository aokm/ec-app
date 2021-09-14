class ShopsController < ApplicationController
  def index
    shops = Shop.all

    render json: {
      restaurants: shops
    }, status: :ok
  end
end
