class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :photo,ProfilePictureUploader

  geocoded_by :full_street_address   # can also be an IP address
  # geocoded_by :current_sign_in_ip
  after_validation :geocode          # auto-fetch coordinates
end
