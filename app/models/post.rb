class Post < ApplicationRecord
    # belongs_to :user
    validates :message, length: { maximum: 140 },
    presence: true
end