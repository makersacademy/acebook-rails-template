# frozen_string_literal: true

# This post has many likes - but when a post is destroyed, so are the likes
class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :message, presence: true, length: { minimum: 1, maximum: 300 }
  validates :user_id, presence: true
end
