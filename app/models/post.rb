class Post < ApplicationRecord

  # sets up database relationship for one user has many posts with a foreign key
  belongs_to :users, class_name: 'User', :foreign_key => "user_id"

end
