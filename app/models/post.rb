# frozen_string_literal: true

class Post < ApplicationRecord
  validates :message, presence: true
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :likes, dependent: :destroy
end
