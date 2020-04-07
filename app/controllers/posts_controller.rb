class PostsController < ApplicationController

#   def new
#     @post = Post.new
#   end

  def create
    #Please look at sessions
    @user = User.create(name: 'testing', dob: '04/04/20', cob: 'england', mob: 999, email: 'test@test.com', password: 'password')
    @post = Post.create(poster_id: @user.id, content: params[:message], time: Time.now)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    # @post = Post.create(poster_id: "1", content: params[:message], time: Time.now)
  end
end
