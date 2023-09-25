class UserProfilesController < ApplicationController
    def show
        @user = User.find_by(username: params[:username])
        @posts = Post.where(user_id: @user.id)
        if @user
            render 'user_profiles/user_profile'
        else
            render 'user_profiles/username_error'
        end
      end
end
