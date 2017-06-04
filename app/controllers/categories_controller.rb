class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit destroy]

  def index
    @categories = Category.all
  end

  def show
    @order_item = current_order.order_items.new
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
