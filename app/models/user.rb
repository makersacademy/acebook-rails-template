class User < ApplicationRecord
  validates_presence_of :username, :password
  validates_uniqueness_of :username
  has_many :courses, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_secure_password
  has_one_attached :profile_avatar, :profile
  some_profile.avatar.attached?
  some_profile.avatar.purge
  some_profile.avatar.purge_later
end
