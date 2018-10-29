# frozen_string_literal: true

# Helper functions for the ImagePosts controller
module ImagePostsHelper
  def find_image_post_email(post)
    User.find(post.user_id).email
  end

  def get_images_by_user(user_id)
    ImagePost.where(user_id: user_id)
  end
end
