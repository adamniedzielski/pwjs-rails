json.array!(@cities) do |city|
  json.extract! city, :id, :name, :lat, :lon
  json.url city_url(city, format: :json)
end
