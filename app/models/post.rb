# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :postimage, PostimageUploader
  acts_as_votable
  belongs_to :user
  delegate :first_name, to: :user, prefix: true
 

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end

# def upvote_score
#   self.get_upvotes.size
# end

# def downvote_score
#   self.get_downvotes.size
# end
