# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :message, presence: true
  has_many :post_likes, dependent: :destroy
end
