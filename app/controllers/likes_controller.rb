class LikesController < ApplicationController
    before_action :find_post
    before_action :find_like, only: [:destroy]

    def create
    if already_liked?
        flash[:notice] = "No more likes for you!"
    else
        @post.likes.create(user_id: session[:current_user])
    end
    redirect_to '/home'
    end

    def destroy
        if !(already_liked?)
            flash[:notice] = "Cannot unlike"
        else
            @like.destroy
        end
        redirect_to '/home'
    end

    private

    def find_post
        @post = Post.find(params[:post_id])
    end

    def already_liked?
      Like.where(user_id: session[:current_user], post_id: params[:post_id]).exists?
    end

    def find_like
        @like = @post.likes.find(params[:id])
    end
end
