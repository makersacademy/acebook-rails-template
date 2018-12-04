class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 } #only allows user to add content maximum of 140 characters
  default_scope -> { order(created_at: :desc) } #newest tweets / posts first
end
