json.(@recipe, :id, :title, :color, :slug)
json.description @recipe.description
json.how_to_cook @recipe.how_to_cook
json.ingredients @recipe.recipe_ingredients do |ri|
  json.id ri.id
  json.amount ri.amount
  json.name ri.ingredient.name if user_signed_in?
  json.description ri.description if user_signed_in?
  json.amount_description ri.amount_description if user_signed_in?
  json.premium ri.ingredient.premium
end
