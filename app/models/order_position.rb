class OrderPosition < ActiveRecord::Base
  belongs_to :product
  belongs_to :container, :polymorphic => true
  attr_accessible :amount, :price

  before_validation :calculate_price

  private
    def calculate_price
      self.price = self.product.gross_price * self.amount
    end
end
