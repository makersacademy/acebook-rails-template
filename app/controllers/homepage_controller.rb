class HomepageController < ApplicationController

    def index
        @user = User.find(session[:current_user])
        @users = User.all
        @posts = []
        @user.following.each do | follower |
            @posts << Post.where(:poster_id => follower.id) 
            @posts = @posts.flatten.sort_by{ | post | post.time }
        end
        # @posts = Post.all
        @comments = Comment.all
    end

end