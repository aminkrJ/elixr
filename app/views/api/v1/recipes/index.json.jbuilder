json.array! @recipes do |recipe|
  json.id recipe.id
  json.title recipe.title
  json.photo_url recipe.photo.url(:thumb)
  json.slug recipe.slug
  json.color recipe.color
end
