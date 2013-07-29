class OrderPosition < ActiveRecord::Base
  belongs_to :product
  belongs_to :container, :polymorphic => true
  attr_accessible :amount, :price
  validates :amount, :numericality => { :greater_than_or_equal_to => 1 }
  before_validation :calculate_price

  private
    def calculate_price
      self.price = self.product.gross_price * self.amount
    end
end
