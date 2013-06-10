class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  has_one :order
  attr_accessible :address_line_1, :address_line_2, :city, :first_name, :last_name, :postal_code, :country_id
end
