class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :username, :presence => true

  has_many :posts

  has_attached_file :image,
  styles: { large: "600x600>", medium: "300x300>", thumb: "150x150" },
  :default_url => 'fishbook-logo.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
