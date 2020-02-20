# frozen_string_literal: true

# rails app/models/post.rb
# mount_uploader :image, ImageUploader

class Post < ApplicationRecord
  belongs_to :user
end
