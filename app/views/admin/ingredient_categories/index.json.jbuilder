json.array!(@admin_ingredient_categories) do |admin_ingredient_category|
  json.extract! admin_ingredient_category, :id, :title, :color, :description
  json.url admin_ingredient_category_url(admin_ingredient_category, format: :json)
end
