class Post < ApplicationRecord
    belongs_to :user, required: true
    has_many :comments, dependent: :destroy
end
