json.array! @recipes do |recipe|
  json.id recipe.id
  json.title recipe.title
  json.description recipe.description
  json.tag recipe.tag
  json.photo_url recipe.photo.url(:thumb)
  json.slug recipe.slug
  json.color recipe.color
end
