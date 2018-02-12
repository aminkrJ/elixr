class Tag < ActiveRecord::Base
  has_many :products, through: :product_tags, dependent: :destroy
  has_many :product_tags
end
