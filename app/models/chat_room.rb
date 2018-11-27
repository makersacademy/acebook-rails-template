class ChatRoom < ApplicationRecord
  validates :title, presence: true,
                      length: { minimum: 1 }
  belongs_to :user
  has_many :messages, dependent: :destroy
end
