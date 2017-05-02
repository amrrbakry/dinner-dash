class OrdersController < ApplicationController
  before_action :authenticate_user!
  def show
    @order = current_order
  end

  def index 
    @orders = Order.all
  end
end
