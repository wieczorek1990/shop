class Basket < ActiveRecord::Base
  belongs_to :user
  has_many :order_positions, :as => :container

  def add_to_basket(product_id)
    op = OrderPosition.where(:product_id => product_id, :container_id => self.id, :container_type => 'Basket').first
    if op.nil?
      op = OrderPosition.new
      op.product_id = product_id
      op.container = self
      op.amount = 1;
      op.price = Product.find(product_id).gross_price
    else
      op.amount += 1
      op.price += Product.find(product_id).gross_price
    end
    op.save
  end
end
