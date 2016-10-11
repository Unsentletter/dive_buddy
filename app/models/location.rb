class Location < ApplicationRecord
  has_many :location_lists
  has_many :profiles, through: :location_lists
end
