json.extract! profile, :id, :name, :number_of_dives, :description, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)