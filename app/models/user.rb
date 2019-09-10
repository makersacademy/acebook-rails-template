class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true

end
