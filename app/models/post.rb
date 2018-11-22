# frozen_string_literal: true

# posts!
class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :comments, as: :commentable
end
