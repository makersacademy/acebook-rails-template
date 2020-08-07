class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true,
                    length: { minimum: 6, maximum: 10 }
  validates :name, presence: true  
  has_many :posts

  
  has_attached_file :image, styles: { :image => "120x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
