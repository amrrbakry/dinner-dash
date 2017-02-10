class Admin::CategoriesController < ApplicationController
	before_action :set_category, 	only: [:show, :edit, :destroy, :update] 
	before_action :admin?

	def show
	end

	def index
		@categories = Category.all
	end
	
	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = "category created successfully"
			redirect_to root_url
		else
			render :new
			flash.now[:alert] = "Error creating category"
		end
	end

	def new
		@category = Category.new
	end

	def edit
	end

	def update
		if @category.update(category_params)
			flash[:notice] = "category updated!"
			redirect_to @category
		else
			render :edit
			flash.now[:alert] = "Error updating category"
		end
	end

	def destroy
		@category.destroy
		flash[:notice] = "category deleted!"
		redirect_back(fallback_location: root_url)
	end

	private

		def set_category
			@category = Category.find(params[:id])
		end

		def category_params
			params.require(:category).permit(:title, :description)
		end
end
