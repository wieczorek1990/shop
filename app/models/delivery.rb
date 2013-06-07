class Delivery < ActiveRecord::Base
  attr_accessible :cost, :name
  has_one :order
end
