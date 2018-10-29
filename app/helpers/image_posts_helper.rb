# frozen_string_literal: true

# Helper functions for the ImagePosts controller
module ImagePostsHelper
  def get_images_by_user(user_id)
    ImagePost.where(user_id: user_id)
  end
end
