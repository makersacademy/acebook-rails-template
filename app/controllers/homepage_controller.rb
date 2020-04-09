class HomepageController < ApplicationController

    def index
        @user = User.find(session[:current_user])
        @posts = Post.all
        @comments = Comment.all
    end

end