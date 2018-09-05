# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments
  has_many :likes, dependent: :destroy
end
