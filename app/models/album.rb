# frozen_string_literal: true

class Album < ApplicationRecord
  has_many_attached :images, dependent: :destroy
end
