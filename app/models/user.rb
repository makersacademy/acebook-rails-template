# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, :recoverable, :rememberable
  devise :database_authenticatable, :registerable,
         :validatable
  has_many :posts

  def self.reverse_posts(posts)
    posts.sort { |a, b| b.updated_at <=> a.updated_at }
  end

  def self.filter(all_posts, wall_owner)
    @results = []

    all_posts.each do |user| 
      user.posts.each do |post|
        if post.wall_id == wall_owner.id
          @results.append(post)
        elsif (post.wall_id == nil) && (post.user_id == wall_owner.id)
          @results.append(post)
        end
      end
    end
    @results
  end


end
