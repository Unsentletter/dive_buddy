class Messenger < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :profile
  validates_presence_of :body, :conversation_id, :user_id

  def messenger_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
