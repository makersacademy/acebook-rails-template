class TimelinePost < ApplicationRecord
  has_many :users

  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
end
