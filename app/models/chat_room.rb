class ChatRoom < ApplicationRecord
  belongs_to :profile
  has_many :messages, dependent: :destroy
end
