class Friend < ApplicationRecord
  belongs_to :friend1, :class_name => "User", :foreign_key => "friend1_id"
  belongs_to :friend2, :class_name => "User", :foreign_key => "friend2_id"
end
