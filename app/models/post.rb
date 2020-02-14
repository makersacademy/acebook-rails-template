# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :message, presence: true
end
