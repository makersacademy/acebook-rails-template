class Post < ApplicationRecord
  belongs_to :user

  def username(post_user_id = post.user_id)
    User.find(post_user_id).username
  end
end
