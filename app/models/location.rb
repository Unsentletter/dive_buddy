class Location < ApplicationRecord
  has_many :location_lists
  has_many :profiles, through: :location_lists
  has_many :location_reviews, dependent: :destroy

  # after_create :create_location_list

  reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode


end
