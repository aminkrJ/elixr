class ProductRecipe < ActiveRecord::Base
  belongs_to :product
  belongs_to :recipe
end
