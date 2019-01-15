# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :message, presence: true
  has_many :likes, through: :post_likes
end
