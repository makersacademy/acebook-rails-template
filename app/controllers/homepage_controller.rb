class HomepageController < ApplicationController

    def index
        @user = User.find(session[:current_user])
        @users = User.all
        @posts = []
        @posts << Post.where(:poster_id => @user.id)
        @posts = @posts.flatten
        @user.following.each do | follower |
            @posts << Post.where(:poster_id => follower.id) 
            @posts = @posts.flatten.sort_by{ | post | post.time }
        end
        @comments = Comment.all
    end

end