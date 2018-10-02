class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  acts_as_votable

  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :content
end
