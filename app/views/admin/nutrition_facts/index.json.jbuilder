json.array!(@nutrition_facts) do |nutrition_fact|
  json.extract! nutrition_fact, :id, :name, :parent_id
  json.url nutrition_fact_url(nutrition_fact, format: :json)
end
