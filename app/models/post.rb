# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments

  def self.under_ten_mins(post)
    (Time.now - post.created_at) < 600
  end
end
