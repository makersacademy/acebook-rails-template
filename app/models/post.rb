class Post < ApplicationRecord
  belongs_to :author
  validates :user_id, presence: true
  validates :message, presence: true
end
