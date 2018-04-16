# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  # belongs_to :user
  has_many :comment_likes
  validates :body, presence: true
  validates :commenter, presence: true
end
