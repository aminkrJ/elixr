json.array!(@cooks) do |cook|
  json.extract! cook, :id, :name
  json.url cook_url(cook, format: :json)
end
