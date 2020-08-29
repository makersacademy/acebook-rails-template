class Post < ApplicationRecord
  belongs_to :user
  def get_owner
    User.find(user_id).first_name
  end
end
