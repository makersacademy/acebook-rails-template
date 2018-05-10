class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
end
