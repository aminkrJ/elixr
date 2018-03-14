json.(@product, :gluten_free, :vegan, :non_gmo, :organic, :id, :name, :description, :price, :primary, :serving_size, :before_discount_price, :weight, :nutrition_fact, :serving_idea)
json.id @product.id
json.name @product.name
json.description @product.description
json.short_description @product.short_description
json.slug @product.slug
json.nutrition_fact @product.nutrition_fact
json.photo do
 json.thumb @product.photo.url(:thumb)
 json.medium @product.photo.url(:medium)
 json.original @product.photo.url
end
json.ingredients @product.product_ingredients do |i|
  json.id i.ingredient.id
  json.name i.ingredient.name
  json.extract i.extract
  json.info_link i.info_link
end
json.photos @product.product_photos do |pp|
 json.photo_type pp.photo_type
 json.thumb pp.photo.url(:thumb)
 json.medium pp.photo.url(:medium)
 json.original pp.photo.url
 json.width pp.photo.width
 json.height pp.photo.height
end
json.recipes @product.product_recipes do |pr|
   json.id pr.recipe.id
   json.order pr.order
   json.description pr.recipe.description
   json.short_description pr.recipe.short_description
   json.how_to_cook pr.recipe.how_to_cook
   json.title pr.recipe.title
   json.slug pr.recipe.slug
   json.category do |c|
     json.id pr.recipe.recipe_category.id
     json.name pr.recipe.recipe_category.name
     json.description pr.recipe.recipe_category.description
     json.short_description pr.recipe.recipe_category.short_description
   end
   json.photo do
     json.thumb pr.recipe.photo.url(:thumb)
     json.medium pr.recipe.photo.url(:medium)
     json.original pr.recipe.photo.url
   end
end
json.category do
  json.id @product.product_category.try(:id)
 json.name @product.product_category.try(:name)
end
json.tags @product.tags do |t|
  json.id t.id
  json.name t.name
end
json.created_at @product.created_at

