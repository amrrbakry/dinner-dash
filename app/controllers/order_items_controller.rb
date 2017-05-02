class OrderItemsController < ApplicationController
  before_action :set_order, only: %i[create update destroy]
  before_action :set_order_item, only: %i[update destroy]
  def create
    add_new_or_exisitng_order_item(params[:order_item][:item_id])
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :item_id, extras: [])
  end

  def order_item_params_without_quantity
    params.require(:order_item).permit(:item_id, extras: [])
  end

  def set_order
    @order = current_order
  end

  def set_order_item
    @order_item = @order.order_items.find(params[:id])
  end

  def add_new_or_exisitng_order_item(item_id)
    @order_item = @order.order_items.find_by(item_id: Item.find(item_id))
    if @order_item
      update_exisiting_order_item(@order_item)
    else
      @order_item = @order.order_items.new(order_item_params)
    end
  end

  def update_exisiting_order_item(order_item)
    order_item.increment_quantity
    order_item.extras.clear
    order_item.update_attributes(order_item_params_without_quantity)
  end
end
