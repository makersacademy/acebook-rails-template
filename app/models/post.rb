class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user
  # belongs_to :wall, :class_name => "User", :foreign_key => "user_id"
  has_one_attached :image

end
