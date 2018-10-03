# require 'rails_helper'

# RSpec.describe 'Api V1 PostsController', type: :request do
#   describe "GET /new " do
#     it "responds with 302" do
#       get :new
#       expect(response).to have_http_status(302)
#     end
#   end

#   describe "GET /api/v1/posts" do
#     it "responds with 200" do
#       get :index
#       expect(response).to have_http_status(2000)
#     end
#   end

#   describe '#create' do
#     it "adds a post with user id to the database" do
#       @user = User.create({ email: "test@test.com", password: "tester" })
#       @post = Post.create({ message: 'test', user_id: @user.id})
#       expect(Post.all.include?(@post)).to be(true)
#     end
  
#     it "doesn\'t add empty message" do
#       @post = Post.create({message: ''})
#       expect(Post.all.include?(@post)).to be(false)
#     end
#   end
# end
