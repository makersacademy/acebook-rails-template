class LikesController < ApplicationController
    before_action :find_post


    def create
        if already_liked?
            redirect_to posts_path, notice: "Yo, stop liking this"
        else
            @post.likes.create(user_id: current_user.id) 
            redirect_to posts_path
        end
    end

    private

    def find_post
        @post = Post.find(params[:post_id])
    end
    
    def already_liked?
        Like.where(user_id: current_user.id, post_id:
        params[:post_id]).exists?
    end

end