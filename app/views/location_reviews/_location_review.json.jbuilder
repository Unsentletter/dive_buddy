json.extract! location_review, :id, :profile_id, :location_id, :review, :rating, :created_at, :updated_at
json.url location_review_url(location_review, format: :json)