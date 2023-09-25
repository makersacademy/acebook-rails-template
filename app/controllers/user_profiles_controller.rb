class UserProfilesController < ApplicationController
    def show
        @user = User.find_by(username: params[:username])
        if @user
            render 'user_profiles/user_profile'
        else
            render 'user_profiles/username_error'
        end
      end
end
