class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :producer
  attr_accessible :availability, :gross_price, :name, :net_price, :description, :category_id, :producer_id
  attr_accessible :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  before_validation :calculate_gross_price

  private
    def calculate_gross_price
      self.gross_price = self.net_price * (1.0 + Settings.vat_percent)
    end
end
