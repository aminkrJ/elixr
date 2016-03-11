json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :description, :how_to_cook, :difficulty
  json.url recipe_url(recipe, format: :json)
end
