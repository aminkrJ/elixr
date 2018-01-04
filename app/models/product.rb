class Product < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "240x150>", thumb: "160x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  scope :primary, -> {where(primary: true)}

  belongs_to :product_category

  has_many :carts, through: :carts_product
  has_many :carts_product

  has_many :ingredients, through: :product_ingredients
  has_many :product_ingredients

  has_many :product_photos

  has_many :recipes, through: :product_recipes
  has_many :product_recipes

  has_many :tags, through: :product_tags
  has_many :product_tags

  accepts_nested_attributes_for :product_ingredients, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :product_recipes, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :product_tags, allow_destroy: true, reject_if: :all_blank
end
