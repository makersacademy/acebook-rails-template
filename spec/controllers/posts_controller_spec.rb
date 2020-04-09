require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 200 if not logged in" do
      get :new
      expect(response).to have_http_status(200)
    end
end
end

#     it "sets up the homepage" do
#         user = create(:user)
#         sign_in user
#         get :users
#         expect(subject).to render_template('users')
#   end
# end


#   describe "POST /" do
#     it "redirects to posts url when post is created" do
#       user = create_a_user(:user)
#       sign_in user
#       post :create_a_user, params: { post: { message: "What up"} }
#       expect(response).to redirect_to(posts_url)
#     end
# end

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
