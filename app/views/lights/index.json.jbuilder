json.lights do |lights|
  lights.array!(@lights) do |light|
    lights.extract! light, :id, :name, :on_code, :off_code
    lights.url location_light_url(@location, light, format: :json)
    lights.type 'Light'
  end
end
