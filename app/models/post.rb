class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 450 } #only allows user to add content maximum of 450characters
  default_scope -> { order(created_at: :desc) } #newest  / posts first
end
