class Post < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :likes, dependent: :destroy
end
