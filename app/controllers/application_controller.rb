class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # user is admin?
  def admin?
		redirect_to(root_url) unless current_user.try(:admin)
	end
end
