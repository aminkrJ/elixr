json.array!(@meals) do |meal|
  json.id meal.id
  json.name meal.name
  json.description meal.description
  json.photo_url meal.photo.url(:thumb)
  json.light meal.light
  json.vegan meal.vegan
  json.gluten_free meal.gluten_free
  json.organic meal.organic
  json.raw meal.raw
  json.restaurant do
    json.name meal.restaurant.name
    json.address meal.restaurant.address
  end
end
