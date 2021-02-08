class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :user_id, :content
end
