class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, :presence => true,
                   :uniqueness => {:case_sensitive => true},
                   :length => {:within => 6..10}
end
