class SessionsController < Devise::SessionsController
  def create
    super
    basket = Basket.where(:user_id => current_user.id)
    if basket.empty?
      basket = Basket.new
      basket.user = current_user
      basket.save
    end
  end
end