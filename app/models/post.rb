class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates_presence_of :content
end