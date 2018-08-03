require 'rails_helper'
require 'helpers/users_helper_spec'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      user = User.create!(email: 'example@example.com', password: '1234567')
      sign_in(user)
      get :new
      expect(response).to have_http_status(200)
    end
  end
# we think that our new re_directs are changing the request status.
# Is this an issue or do we need to just update tests to fit.


  describe "POST /" do
    it "responds with 200" do
      user = User.create!(email: 'example@example.com', password: '1234567')
      sign_in(user)
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      user = User.create!(email: 'example@example.com', password: '1234567')
      sign_in(user)
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      user = User.create!(email: 'example@example.com', password: '1234567')
      sign_in(user)
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
