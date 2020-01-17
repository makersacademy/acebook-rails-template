class User < ApplicationRecord
  include Clearance::User

  include Clearance::User

  validates :password, :presence => true,
            :confirmation => true,
            :length => {:within => 6..10},
            :on => :create


end