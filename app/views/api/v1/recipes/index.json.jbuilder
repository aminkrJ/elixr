json.array! @recipes do |recipe|
 json.id recipe.id
 json.title recipe.title
 json.description recipe.description
 json.short_description recipe.short_description
 json.tag recipe.tag
 json.slug recipe.slug
 json.photo do
   json.thumb recipe.photo.url(:thumb)
   json.medium recipe.photo.url(:medium)
   json.original recipe.photo.url
 end
 json.created_at recipe.created_at.to_i
end
