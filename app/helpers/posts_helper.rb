# frozen_string_literal: true

# Helper functions for the Posts Controller
module PostsHelper
  def user_made_this_post(post)
    return false unless current_user

    current_user.id == post.user_id
  end

  def find_post_email(post)
    User.where(id: post.user_id)[0].email
  end
end
