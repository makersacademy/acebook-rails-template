class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :friend1, :foreign_key => :friend1_id, class_name => "User"
  # belongs_to :friend2, :foreign_key => :friend2_id, class_name => "User"
end
