# frozen_string_literal: true

# posts!
class Post < ApplicationRecord
  include Commentable
  belongs_to :user, foreign_key: 'user_id'
end
