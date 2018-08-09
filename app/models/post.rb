# frozen_string_literal: true

# Post class and its dependencies
class Post < ApplicationRecord
  has_many :comments, dependent: :delete_all
  belongs_to :user
end
