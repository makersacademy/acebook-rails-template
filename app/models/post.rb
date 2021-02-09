class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :retweets, class_name: "Post", 
  foreign_key: "original_post_id"
  
  belongs_to :original_post, class_name: "Post", optional: true

  validates_presence_of :content
end