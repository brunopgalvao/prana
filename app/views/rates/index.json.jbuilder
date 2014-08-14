json.array!(@rates) do |rate|
  json.extract! rate, :package, :price
  json.url rate_url(rate, format: :json)
end