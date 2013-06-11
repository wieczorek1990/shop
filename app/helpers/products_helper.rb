module ProductsHelper
  def number_to_currency2(price)
    number_to_currency(price / 100.0, :format => "%n %u", :unit => Settings.currency_abbreviation)
  end
end
