class DeletePostsWithNoUserId < ActiveRecord::Migration[5.1]

  def change
    @nilposts = Post.where(user_id: nil)
    @nilposts.each do |post|
      post.destroy
    end
  end
  
end
