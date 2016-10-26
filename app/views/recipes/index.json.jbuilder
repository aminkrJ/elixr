json.array! @recipes do |recipe|
  json.id recipe.id
  json.title recipe.title
  json.photo_url recipe.photo.url(:thumb)
  json.slug recipe.slug
  json.slug recipe.color
  json.ingredients recipe.ingredients do |ingredient|
    json.name ingredient.name
    json.amount ingredient.amount
    if ingredient.unit
      json.unit do
        json.name ingredient.unit.name
        json.symbol ingredient.unit.symbol
      end
    end
  end
end
