class Post < ApplicationRecord
  # belongs_to :user , foreign_key: "creator_id"
  has_many :comments, dependent: :destroy
  validates :description, presence: true,
                          length: { minimum: 1 }
end
