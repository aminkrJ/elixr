json.array!(@intakes) do |intake|
  json.extract! intake, :id, :age_from, :age_to, :amount, :period
  json.url intake_url(intake, format: :json)
end
