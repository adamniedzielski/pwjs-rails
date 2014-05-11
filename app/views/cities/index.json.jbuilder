json.array!(@cities) do |city|
  json.extract! city, :id, :name, :lat, :lon
end
