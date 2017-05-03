class OrdersController < ApplicationController
  before_action :authenticate_user!
  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.all
  end
end
