class User < ApplicationRecord
  has_many :posts
  has_one :profile
  after_create :create_profile
  validates :firstname, presence: true
  validates :lastname, presence: true
  has_secure_password 
  validates :password, length: {minimum: 6, maximum: 10}, on: :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, format: { with:URI::MailTo::EMAIL_REGEXP }

  private

  def create_profile
    Profile.create(user: self)
  end
  
end
