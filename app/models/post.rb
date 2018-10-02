class Post < ApplicationRecord
  validates :message, presence: true
  default_scope { order(created_at: :desc)}
  belongs_to :user
end
