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
#       expect(response).to redirect_to("/posts")
#     end

#     it "creates a post" do
#       post :create, params: { post: { message: "Hello, world!" } }
#       expect(Post.find_by(message: "Hello, world!")).to be
#     end
#   end

#   describe "GET /" do
#     it "responds with 302 because it's redirected to the login page" do
#       get :index
#       expect(response).to have_http_status(302)
#     end
#   end

#   it "contains all the posts objects" do
#     post :create, params: { post: { message: "First posted messege!"  } }
#     post :create, params: { post: { message: "Second posted messege!" } }
#     expect(Post.all[0].message).to eq("First posted messege!")
#     expect(Post.all[1].message).to eq("Second posted messege!")
#   end
# end
