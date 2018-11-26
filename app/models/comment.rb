class Comment < ApplicationRecord
  belongs_to :post

  def find_by_id(id)
    Comment.where(["post_id = id"])
  end
end
