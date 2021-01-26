class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A(.+)@(.+)\z/,message: "invalid"  }
  validates :password, :presence => true,
                   :uniqueness => {:case_sensitive => true},
                   :length => {:within => 6..10}
end
