require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "works! (now write some real specs)" do
      get posts_path
      expect(response).to have_http_status(200)
    end
  end
end

# RSpec.describe Post, type: :request do
#   describe "post" do
#     p "Starting test"
#     it "creates a new post" do
#       p "First line of test"
#       sign_in
#       p "Second line of test"
#       get "/posts/new"
#       post = Post.create({ user_id: 1, message: 'Test post'})
#       get "/"
#       expect(response).to be_successful
#       expect(response.body).to include(“Test post”)
#     end
#   end
# end
