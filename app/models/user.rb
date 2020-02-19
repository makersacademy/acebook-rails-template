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

end
