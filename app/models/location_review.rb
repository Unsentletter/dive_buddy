class LocationReview < ApplicationRecord
  belongs_to :profile
  belongs_to :location
end
