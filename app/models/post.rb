# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments
end
