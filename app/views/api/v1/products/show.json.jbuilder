json.(@product, :id, :name, :description, :price, :primary, :weight, :nutrition_fact, :serving_idea, :ingredients)
json.id @product.id
json.name @product.name
json.description @product.description
json.slug @product.slug
json.category @product.category
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
json.created_at @product.created_at

