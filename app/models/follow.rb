class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'Person'
  belongs_to :followee, class_name: 'Person'
end
