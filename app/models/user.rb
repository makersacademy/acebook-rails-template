class User < ApplicationRecord
<<<<<<< HEAD
   validates :name, :username, :email, :password, presence: true
   validates :password, length: { in: 8..20 }
   validates :email, uniqueness: true
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

   has_secure_password
=======
>>>>>>> master
end
