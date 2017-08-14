class CartProduct < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  has_many :ingredinets, through: :cart_product_ingredients
  has_many :cart_product_ingredients

  accepts_nested_attributes_for :cart_product_ingredients
end
