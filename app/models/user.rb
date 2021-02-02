class User < ApplicationRecord
  has_many :posts, dependent: :destroy
end
