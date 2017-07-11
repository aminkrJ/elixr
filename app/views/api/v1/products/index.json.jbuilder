json.array! @products do |product|
 json.id product.id
 json.name product.name
 json.description product.description
 json.price product.price
 json.primary product.primary
 json.slug product.slug
 json.photo do
   json.thumb product.photo.url(:thumb)
   json.medium product.photo.url(:medium)
 end
 json.ingredients product.product_ingredients do |pi|
   json.name pi.ingredient.name
   json.weight pi.weight
   json.percentage pi.percentage
 end
 json.created_at product.created_at.to_i
end
