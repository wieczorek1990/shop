class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  has_one :order
  attr_accessible :address_line_1, :address_line_2, :city, :first_name, :last_name, :postal_code, :country_id, :user_id, :name
  validates :address_line_1, :city, :first_name, :last_name, :postal_code, :country_id, :user_id, :name, :presence => true
  validates_format_of :postal_code, :with => /\d{2}\-\d{3}/
end
