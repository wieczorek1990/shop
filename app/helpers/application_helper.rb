module ApplicationHelper
  def admin?
    user_signed_in? and current_user.has_role? :admin
  end

  def number_to_currency2(price)
    if price.nil?
      price = 0
    end
    number_to_currency(price / 100.0, :format => "%n %u", :unit => Settings.currency_abbreviation)
  end
end
