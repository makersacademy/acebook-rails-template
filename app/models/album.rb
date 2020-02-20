# frozen_string_literal: true

class Album < ApplicationRecord
  mount_uploaders :images, ImageUploader
end
