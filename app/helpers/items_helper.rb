module ItemsHelper
  def admin_role?
    current_user.try(:admin)
  end
end
