require 'rails_helper'
require_relative '../features/sign_up_helper'


RSpec.describe PostsController, type: :controller do

  describe "GET /new " do
    it "responds with 200" do
      get new_post_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    xit "responds with 200" do
      user :create, params: { user: {firstname: "test", lastname: "test", email: "test@test.com", password: "password"}}
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    xit "creates a post" do
      user :create, params: { user: {firstname: "test", lastname: "test", email: "test@test.com", password: "password"}}
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 302" do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
