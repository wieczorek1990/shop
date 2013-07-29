class Order < ActiveRecord::Base
  belongs_to :address
  belongs_to :delivery
  belongs_to :payment_method
  belongs_to :user
  has_many :order_positions, :as => :container
  attr_accessible :delivery_cost, :status, :value, :address_id, :delivery_id, :payment_method_id
end
