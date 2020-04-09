class Post < ApplicationRecord
    has_many :comments
    validates :title, presence: true
    validates :text, presence: true
end
