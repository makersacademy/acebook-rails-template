class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
end
