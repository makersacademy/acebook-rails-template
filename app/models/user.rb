class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true,
                       length: { in: 6..10 }

	def can_edit? post
	    post.user_id == self.id
	end 

end
