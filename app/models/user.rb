class User < ApplicationRecord

  validates_presence_of :username, :password
  validates_uniqueness_of :username
  has_secure_password

  has_many :courses, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  
  has_one_attached :avatar
  after_commit :add_default_avatar, on: [:create, :update]

  private def add_default_avatar
    unless avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-profile.png")), filename: 'default-profile.png' , content_type: "image/png")
    end
  end

end
