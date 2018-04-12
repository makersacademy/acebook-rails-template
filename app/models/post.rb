# frozen_string_literal: true

class Post < ApplicationRecord
  # belongs_to :users
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :message, presence: true
end
