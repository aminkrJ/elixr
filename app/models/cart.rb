class Cart < ActiveRecord::Base
  has_many :products, through: :carts_product
  has_many :carts_product
end
