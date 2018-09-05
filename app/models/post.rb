# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :postimage, PostimageUploader
  acts_as_votable
  belongs_to :user
  delegate :first_name, to: :user, prefix: true
  has_many :comments
 
  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end
