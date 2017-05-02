module Admin
  class ItemsController < ApplicationController
    before_action :set_item, only: %i[show edit destroy update]
    before_action :admin?

    def show; end

    def index
      @items = Item.all
    end

    def create
      @item = Item.new(item_params)
      if @item.save
        flash[:notice] = "Item created successfully"
        redirect_to root_url
      else
        render :new
        flash.now[:alert] = "Error creating item"
      end
    end

    def new
      @item = Item.new
      @category_item = CategoryItem.new
    end

    def edit; end

    def update
      if @item.update(item_params)
        flash[:notice] = "Item updated!"
        redirect_to @item
      else
        render :edit
        flash.now[:alert] = "Error updating item"
      end
    end

    def destroy
      @item.destroy
      flash[:notice] = "Item deleted!"
      redirect_back(fallback_location: root_url)
    end

    private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :description, :price, :picture,
                                   variations_attributes: %i[id title description price o_picture _destroy],
                                   category_items_attributes: %i[id category_id],
                                   options_attributes: [:id, :name, :description, :o_picture, :required, :_destroy,
                                                        values_attributes: %i[id name additional_charge _destroy]])
    end
  end
end
