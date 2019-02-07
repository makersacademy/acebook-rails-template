# require 'rails_helper'
# require_relative '../helpers/users_helper_spec'

# RSpec.describe CommentsController, type: :controller do

#   describe "POST /" do
#     it "responds with 200" do
#       create_user
#       post :create, params: { comment: { message: "Hello, comment!" } }
#       expect(response).to redirect_to(posts_url)
#     end

#     it "creates a post" do
#       create_user
#       post :create, params: { comment: { message: "Hello, comment!" } }
#       expect(Comment.find_by(message: "Hello, comment!")).to be
#     end
#   end

#   describe "GET /" do
#     it "responds with 200" do
#       create_user
#       get :index
#       expect(response).to have_http_status(200)
#     end
#   end
# end
