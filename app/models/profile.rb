class Profile < ApplicationRecord
  belongs_to :user
  has_many :location_lists
  has_many :locations, :through => :location_lists
  mount_uploader :photo,ProfilePictureUploader

#  geocoded_by :full_street_address   # can also be an IP address
  # geocoded_by :current_sign_in_ip
#  after_validation :geocode          # auto-fetch coordinates
end
