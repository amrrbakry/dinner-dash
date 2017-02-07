class ItemsController < ApplicationController
	before_action :set_item, only: [:show, :edit, :destroy] 
	before_action :admin?, except: [:index, :show]

	def index
		@items = Item.all
	end

	def show
	end

	private

		def set_item
			@item = Item.find(params[:id])
		end

		def item_params
			params.require(:item).permit(:title, :description, :price, :picture)
		end
end
