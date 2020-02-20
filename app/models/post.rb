# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  def self.show
    
    @posts = []
    Post.all.reverse_order.each do |post|
      if (post.wall_id == nil) || (post.user_id == post.wall_id)
        p post
        @posts.append(post)
      end
    end
    @posts
  end

  def self.under_ten_mins(post)
    (Time.now - post.created_at) < 600
  end
  
end
