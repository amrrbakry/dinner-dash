class UsersController < ApplicationController

  before_action :authenticate_user!
	before_action :correct_user

  def show
  	@user = User.find(params[:id])
  end

  private

  	# current user only views his own profile
  	def correct_user
  		redirect_to(root_url) unless current_user == @user
  	end
end
