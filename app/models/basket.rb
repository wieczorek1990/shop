class Basket < ActiveRecord::Base
  belongs_to :user
  has_many :order_positions, :as => :container
  attr_accessible :status
end
