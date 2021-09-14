class OrdersController < ApplicationController
  def create
    temp_orders = TempOrder.where(id: params[:temp_order_ids])
    order = Order.new(total_price: total_price(temp_orders))
    order.save_with_update_temp_orders!(temp_orders)
    render json: { order: order }, status: :created
  rescue StandardError
    render json: {}, status: :internal_server_error
  end

  private

  def total_price(temp_orders)
    temp_orders.sum(&:total_amount)
  end
end
