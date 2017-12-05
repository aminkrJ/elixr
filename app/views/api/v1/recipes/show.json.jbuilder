json.(@recipe, :id, :title, :color, :slug)
json.description @recipe.description
json.short_description @recipe.short_description
json.tag @recipe.tag
json.how_to_cook @recipe.how_to_cook
json.nutrition_info @recipe.nutrition_info
json.difficulty @recipe.difficulty
json.serving @recipe.serving
json.photo do
   json.thumb @recipe.photo.url(:thumb)
   json.medium @recipe.photo.url(:medium)
   json.original @recipe.photo.url
 end
json.ingredients @recipe.recipe_ingredients do |ri|
  json.id ri.id
  json.amount ri.amount
  # TODO will be added when we introduced login and subscribe
  #unless ri.ingredient.premium && !user_signed_in?
  json.name ri.ingredient.name
  json.description ri.description
  json.amount_description ri.amount_description
  #end
  json.premium ri.ingredient.premium
end
