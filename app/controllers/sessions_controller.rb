class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to posts_path
      flash[:success] = "Welcome back, #{user.username}"
      # Log the user in and redirect to the user's show page.
    else
      #create an error message
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end

# class PostsController < ApplicationController
#   def new
#     @post = Post.new
#   end

#   def create
#     @post = Post.new(post_params)
#     p "LOOK HERE"
#     p @post
#     # @user = User.find(params[:user_id])
#     # @post = @user.posts.create(post_params)
#     @post.save
#     redirect_to posts_url
#   end

#   def index
#     @posts = Post.all
#   end

#   private

#   def post_params
#     params.require(:post).permit(:message)
#   end
# end

# views/posts/new

# <%= form_for @post do |form| %>
#   <%= form.label :message %>
#   <%= form.text_field :message %>

#   <%= form.submit "Submit" %>
# <% end %>

# views/posts/index

# <% @posts.each do |post| %>
#   <p><%= post.message %></p>
# <% end %>

# <%= link_to new_post_path do %>
#   New post
# <% end %>

# spec/controllers/posts_controller_test

# require 'rails_helper'

# RSpec.describe PostsController, type: :controller do
#   describe "GET /new " do
#     it "responds with 200" do
#       get :new
#       expect(response).to have_http_status(200)
#     end
#   end

#   describe "POST /" do
#     it "responds with 200" do
#       post :create, params: { post: { message: "Hello, world!" } }
#       expect(response).to redirect_to(posts_url)
#     end

#     it "creates a post" do
#       post :create, params: { post: { message: "Hello, world!" } }
#       expect(Post.find_by(message: "Hello, world!")).to be
#     end
#   end

#   describe "GET /" do
#     it "responds with 200" do
#       get :index
#       expect(response).to have_http_status(200)
#     end
#   end
# end
