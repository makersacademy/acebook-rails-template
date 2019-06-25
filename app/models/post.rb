class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :message, :user_id
end
