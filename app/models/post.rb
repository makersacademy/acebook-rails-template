# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :message, length: { maximum: 4000 }
end
