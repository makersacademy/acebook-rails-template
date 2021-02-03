class LikesController < ApplicationController

    def create
        p "inside create"
        permitted_params = like_params
        p permitted_params
        @like = Like.create(permitted_params)
        p @like
        render json: @like
    end

    def destroy
        p "inside destroy"
        @like = Like.where(user_id: session[:user]['id'], post_id: params['post_id'])
        like_id = @like[0]['id']
        Like.destroy(like_id)
        render json: @like
    end

    def find_if_post_is_liked
        p "inside like find method"
        p params['post_id']
        @users_likes = Like.where(user_id: session[:user]['id'], post_id: params['post_id'])
        p @users_likes
        p @users_likes.length
        if @users_likes.length > 0
            render json: {loading: false, liked: true}
        else
            render json: {loading: false, liked: false}
        end
    end

    private

    def like_params
        p "inside like_params"
        p params
        user_id = session[:user]['id']
        p user_id
        params.require(:like).permit(:post_id).merge(:user_id => user_id)
    end
end
