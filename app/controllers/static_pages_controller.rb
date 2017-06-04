class StaticPagesController < ApplicationController
  def home
    @items = Item.all
  end
end
