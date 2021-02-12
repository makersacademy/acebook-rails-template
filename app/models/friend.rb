class Friend < ApplicationRecord
  belongs_to :requester, class_name: "User", foreign_key: :requester_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id
  validates :requester_id, uniqueness: { scope: :receiver_id }
end
