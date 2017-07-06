class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  has_many :ingredient_nutrition_facts
  has_many :nutrition_facts, through: :ingredient_nutrition_facts

  accepts_nested_attributes_for :ingredient_nutrition_facts, allow_destroy: true, reject_if: :all_blank

  belongs_to :unit
  belongs_to :category, class_name: 'IngredientCategory', foreign_key: 'ingredient_category_id'
  belongs_to :cook

  validates :name, presence: true

  amoeba do
    include_association :ingredient_nutrition_facts
  end

  scope :with_category, -> { where.not(ingredient_category_id: nil) }
end
