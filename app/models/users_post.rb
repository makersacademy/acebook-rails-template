class UsersPost < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
