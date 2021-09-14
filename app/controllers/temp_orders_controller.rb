class TempOrdersController < ApplicationController
  before_action :set_food, only: [:create, :replace]

  def index
    temp_orders = TempOrder.active
    if temp_orders.exists?
      render json: {
        temp_orders_ids: temp_orders.ids,
        shop: temp_orders.first.shop,
        quantity: temp_orders.pluck(:quantity).sum,
        amount: temp_orders.sum(&:total_amount)
      }, status: :ok
    else
      render json: {}, status: :no_content
    end
  end

  def create
    if TempOrder.active.other_shop(@ordered_item.shop.id).exists?
      return render json: {
        existing_shop: TempOrder.other_shop(@ordered_item.shop.id).first.shop.name,
        new_shop: Shop.find(params[:item_id]).shop.name
      }, status: :not_acceptable
    end

    build_temp_order(@ordered_item)

    if @temp_order.save
      render json: {
        line_food: @temp_order
      }, status: :created
    else
      render json: {}, status: :internal_server_error
    end
  end

  def replace
    TempOrder.active.other_shop(@ordered_item.shop.id).each do |temp_order|
      temp_order.update!(active: false)
    end

    build_temp_order(@ordered_item)

    if @temp_order.save
      render json: {
        temp_order: @temp_order
      }, status: :created
    else
      render json: {}, status: :internal_server_error
    end

  end

  private

  def set_item
    @ordered_item = Item.find(params[:item_id])
  end

  def build_temp_order(ordered_item)
    if ordered_item.temp_order.present?
      @temp_order = ordered_item.temp_order
      @temp_order.attributes = {
        quantity: ordered_item.temp_order.quantity + params[:quantity],
        active: true
      }
    else
      @temp_order = ordered_item.build_temp_order(
        quantity: params[:quantity],
        shop: ordered_item.shop,
        active: true
      )
    end
  end
end
