class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :commentlikes, dependent: :destroy
  acts_as_votable

end
