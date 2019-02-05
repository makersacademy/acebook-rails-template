class Post < ApplicationRecord
  validates :message, presence: true, length: { minimum: 1 }

  validates :user_id, presence: true
  belongs_to :user
end
