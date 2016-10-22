class Profile < ApplicationRecord
  rolify
  belongs_to :user
  has_many :location_lists
  has_many :locations, :through => :location_lists
  has_many :location_reviews
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :conversations, :foreign_key => :sender_id

  mount_uploader :photo,ProfilePictureUploader




end
