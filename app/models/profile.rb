class Profile < ApplicationRecord
  belongs_to :user
  has_many :location_lists
  has_many :locations, :through => :location_lists
  has_many :location_reviews

  mount_uploader :photo,ProfilePictureUploader

 geocoded_by :current_sign_in_ip   # can also be an IP address
 after_validation :geocode          # auto-fetch coordinates
end
