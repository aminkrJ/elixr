json.(@product, :gluten_free, :vegan, :non_gmo, :organic, :id, :name, :description, :price, :primary, :serving_size, :weight, :nutrition_fact, :serving_idea, :ingredients)
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
json.photos @product.product_photos do |pp|
 json.photo_type pp.photo_type
 json.thumb pp.photo.url(:thumb)
 json.medium pp.photo.url(:medium)
 json.original pp.photo.url
 json.width pp.photo.width
 json.height pp.photo.height
end
json.recipes @product.product_recipes do |pr|
 json.id pr.id
 json.order pr.order
 json.description pr.description
 json.title pr.recipe.title
 json.slug pr.recipe.slug
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

