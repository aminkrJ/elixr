class CartProductIngredient < ActiveRecord::Base
  belongs_to :cart_product
  belongs_to :ingredient
end
