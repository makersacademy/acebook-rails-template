class User < ApplicationRecord
  include Clearance::User

  # has_secure_password
end
