json.array! @recipe_ingredients do |ri|
  unless ri.premium && !user_signed_in?
    json.name ri.name
    json.total_amount ri.total_amount
  end
  json.premium ri.premium
end
