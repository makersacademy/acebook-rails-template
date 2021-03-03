class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
<<<<<<< HEAD
  has_many :likes, dependent: :destroy
=======


  validate :validate_username

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  def validate_username
    if User.where(username: username).exists?
      errors.add(:username, :already_exists) 
    end
  end

>>>>>>> d81a420... Cannot sign up with same username twice with passing tests and change locales file
end
