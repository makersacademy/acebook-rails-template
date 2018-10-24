# frozen_string_literal: true

# This post has many likes - but when a post is destroyed, so are the likes
class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
end
