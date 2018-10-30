class WallPost < ApplicationRecord
  belongs_to :user
  # belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
end
