json.array! @products do |product|
 json.id product.id
 json.name product.name
 json.description product.description
 json.short_description product.short_description
 json.price product.price
 json.weight product.price
 json.primary product.primary
 json.slug product.slug
 json.photo do
   json.thumb product.photo.url(:thumb)
   json.medium product.photo.url(:medium)
   json.original product.photo.url
 end
 json.ingredients product.product_ingredients do |pi|
   json.id pi.id
   json.name pi.ingredient.name
   json.weight pi.weight
   json.percentage pi.percentage
   json.price pi.ingredient.price_per_gram
 end
 json.created_at product.created_at.to_i
end
