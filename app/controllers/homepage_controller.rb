class HomepageController < ApplicationController

    def index
        @user = User.find(session[:current_user])
        @users = User.all
        @posts = Post.all
        @comments = Comment.all
    end

end