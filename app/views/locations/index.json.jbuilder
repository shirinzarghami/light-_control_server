json.locations do |locations|
  locations.array!(@locations) do |location|
    locations.extract! location, :id, :name, :description
    locations.url location_url(location, format: :json)
    locations.type 'Location'
    locations.lights location.lights.pluck(:id)
  end
end
