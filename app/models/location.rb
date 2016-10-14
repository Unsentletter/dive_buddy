class Location < ApplicationRecord
  has_many :location_lists
  has_many :profiles, through: :location_lists
  has_many :location_reviews

  after_create :create_location_list


end
