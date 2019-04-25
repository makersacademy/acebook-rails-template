module PostsHelper
  def get_user_email(post)
    User.find(post.user_id).email
  end
end