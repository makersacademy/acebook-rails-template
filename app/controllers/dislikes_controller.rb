class DislikesController < ApplicationController
    before_action :find_post
    before_action :find_dislike, only: [:destroy]
    
    def create
        if already_disliked?
            flash[:notice] = "No more dislikes for you!"
        else
            @post.dislikes.create(user_id: session[:current_user])
        end
        redirect_to "/home"
    end

    def destroy
        if !(already_disliked?)
            flash[:notice] = "Cannot undislike"
        else
            @dislike.destroy
        end
        redirect_to "/home"
    end

    private

    def find_post
        @post = Post.find(params[:post_id])
    end

    def already_disliked?
        Dislike.where(user_id: session[:current_user], post_id: params[:post_id]).exists?
    end

    def find_dislike
        @dislike = @post.dislikes.find(params[:id])
    end
end
