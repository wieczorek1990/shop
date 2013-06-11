class OrderPosition < ActiveRecord::Base
  belongs_to :product
  belongs_to :container, :polymorphic => true
  attr_accessible :amount, :price
end
