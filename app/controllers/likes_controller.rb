class LikesController < ApplicationController

    def create
        p "inside like controller create"
        permitted_params = like_params
        p permitted_params
        @like = Like.create(permitted_params)
        p @like
        render json: @like
    end

    def find_if_post_is_liked
        find_params = like_params
        render json: {loading: false, liked: true}
    end

    private

    def like_params
        p "inside like_params"
        p params
        params.require(:like).permit(:post_id)
    end
end
