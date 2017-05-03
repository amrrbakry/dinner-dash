class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  # user is admin?
  def admin?
    redirect_to(root_url) unless current_user.try(:admin)
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    elsif (Order.first.status == "pending" if Order.first)
      Order.first
    else
      Order.new
    end
  end
end
