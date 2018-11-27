class Message < ApplicationRecord
  validates :body, presence: true,
                   length: { minimum: 1 }
  belongs_to :user
  belongs_to :chat_room

  def timestamp
    created_at.strftime('%H:%M')
  end

  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
