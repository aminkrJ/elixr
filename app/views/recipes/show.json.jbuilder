json.(@recipe, :id, :title, :color, :slug)
json.description @recipe.description
json.how_to_cook @recipe.how_to_cook
json.ingredients @recipe.recipe_ingredients do |ri|
  json.id ri.id
  json.amount ri.amount
  json.name ri.ingredient.name
  json.description ri.description
  json.amount_description ri.amount_description
end
