# frozen_string_literal: true

class Post < ApplicationRecord

  belongs_to :user
  validates :message, presence: true, length: { minimum: 1, maximum: 300 }
  validates :user_id, presence: true
end
