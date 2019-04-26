# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  def self.verify_user(session_user, user_post)
    session_user.id == user_post.user_id
  end
end
