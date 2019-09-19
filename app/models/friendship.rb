class Friendship < ApplicationRecord
  belongs_to :friend, :class_name => "User"
end
