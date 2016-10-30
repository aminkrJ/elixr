json.array! @products do |product|
 json.id product.id
 json.name product.name
 json.description product.description
 json.price product.price
 json.primary product.primary
 json.photo do
   json.thumb product.photo.url(:thumb)
   json.medium product.photo.url(:medium)
 end
 json.created_at product.created_at
end
