require 'time'

class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  
  def likecount
    self.likes.count
  end
end
