# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  has_many :comment_likes
  validates :body, presence: true, length: { minimum: 1 }
end
