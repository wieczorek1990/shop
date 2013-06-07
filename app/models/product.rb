class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :producer
  attr_accessible :availability, :gross_price, :name, :net_price
  attr_accessible :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
