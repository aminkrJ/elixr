class Ingredient < ActiveRecord::Base
  has_many :ingredient_nutrition_facts
  has_many :nutrition_facts, through: :ingredient_nutrition_facts
  accepts_nested_attributes_for :ingredient_nutrition_facts, allow_destroy: true, reject_if: :all_blank

  belongs_to :unit
  belongs_to :category, class_name: 'RecipeCategory'
  belongs_to :cook

  validates :name, presence: true

  amoeba do
    include_association :ingredient_nutrition_facts
  end
end
