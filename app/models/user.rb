class User < ApplicationRecord
    has_many :likes, dependent: :destroy
end