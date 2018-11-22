# frozen_string_literal: true

# comment model
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end
