class Post < ApplicationRecord
    # validates :content, presense: true

    # belongs_to :user

    # has_many :comments, dependent: :destroy

    has_many :likes, dependent: :destroy
    has_many :dislikes, dependent: :destroy

end

