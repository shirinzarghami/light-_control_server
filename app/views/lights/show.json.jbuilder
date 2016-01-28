json.light do |light|
  light.extract! @light, :id, :name, :created_at, :updated_at
end
