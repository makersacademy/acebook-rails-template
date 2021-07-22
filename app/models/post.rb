class Post < ApplicationRecord
  attr_reader :likes
  
  def initialize
    @likes = 10
  end
end
