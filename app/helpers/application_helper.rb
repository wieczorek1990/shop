module ApplicationHelper
  def admin?
    user_signed_in? and current_user.has_role? :admin
  end
end
