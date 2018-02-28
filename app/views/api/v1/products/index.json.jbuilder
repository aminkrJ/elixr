json.array! @products do |product|
 json.id product.id
 json.name product.name
 json.description product.description
 json.short_description product.short_description
 json.nutrition_fact product.nutrition_fact
 json.price product.price
 json.before_discount_price product.before_discount_price
 json.weight product.weight
 json.primary product.primary
 json.slug product.slug
 json.category do |c|
   json.id product.product_category.try(:id)
   json.name product.product_category.try(:name)
   json.short_description product.product_category.try(:short_description)
 end
 json.photo do
   json.thumb product.photo.url(:thumb)
   json.medium product.photo.url(:medium)
   json.original product.photo.url
 end
 json.photos product.product_photos do |pp|
   json.photo_type pp.photo_type
   json.thumb pp.photo.url(:thumb)
   json.medium pp.photo.url(:medium)
   json.original pp.photo.url
   json.width pp.photo.width
   json.height pp.photo.height
   json.image_size pp.photo.image_size
 end
 json.ingredients product.product_ingredients do |pi|
   json.id pi.id
   json.name pi.ingredient.name
   json.weight pi.weight
   json.percentage pi.percentage
   json.price pi.ingredient.price_per_gram
   json.external_link pi.ingredient.external_link
 end
 json.tags product.tags do |t|
   json.id t.id
   json.name t.name
   json.short_description t.short_description
 end
 json.recipes product.product_recipes do |pr|
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
 json.created_at product.created_at.to_i
end
