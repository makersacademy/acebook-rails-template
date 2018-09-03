# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :postimage, PostimageUploader
  belongs_to :user
  delegate :first_name, to: :user, prefix: true
end
