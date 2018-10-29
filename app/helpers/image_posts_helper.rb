# frozen_string_literal: true

module ImagePostsHelper
  def find_image_post_email(post)
    User.find(post.user_id).email
  end
end
