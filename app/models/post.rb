# frozen_string_literal: true
# Post class and its dependencies
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
end
