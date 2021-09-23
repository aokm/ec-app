class ShopsController < ApplicationController
  def index
    shops = Shop.all

    render json: {
      shops: shops
    }, status: :ok
  end
end
