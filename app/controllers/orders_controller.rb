class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show cancel_order]
  def show; end

  def index
    @orders = Order.all
  end

  def cancel_order
    if @order.cancel
      @order.save
      redirect_to orders_url
      flash[:notice] = "Order canceled successfully!"
    else
      redirect_to orders_url
      flash[:alert] = "Couldn't cancel order"
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
