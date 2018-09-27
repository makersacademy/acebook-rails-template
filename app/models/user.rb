class User < ApplicationRecord

  validates :full_name, presence: true, length: { maximum: 50 }
  validates :handle, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true

end
