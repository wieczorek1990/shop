class RegistrationsController < Devise::RegistrationsController
  def create
    basket = Basket.new
    basket.user = current_user
    basket.save
    super
  end
end