json.extract! location, :id, :location_name, :description, :depth, :difficulty, :latitude, :longitude, :location_lists_id, :created_at, :updated_at
json.url location_url(location, format: :json)