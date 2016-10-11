class Recipe < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients
  belongs_to :category, class_name: 'RecipeCategory'

  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true, reject_if: :all_blank
end
