class Post < ApplicationRecord
  # before_action :authenticate_user!
  acts_as_votable
  belongs_to :user 
  has_many :comments
  
end
