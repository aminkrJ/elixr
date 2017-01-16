json.array!(@meals) do |meal|
  json.extract! meal, :id, :name, :description, :light, :vegan, :raw, :gluten_free, :organic
  json.url admin_meal_url(meal, format: :json)
end
