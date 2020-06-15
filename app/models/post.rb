# frozen_string_literal: true

# post class
class Post < ApplicationRecord
  belongs_to :user, required: false
end
