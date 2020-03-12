class User < ApplicationRecord
  validates :password, presence: true, length: { within: 6..10 }
end
