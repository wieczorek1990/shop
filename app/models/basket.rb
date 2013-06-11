class Basket < ActiveRecord::Base
  belongs_to :user
  has_many :order_positions, :as => :container

  def add_order_position(order_position)

  end
end
