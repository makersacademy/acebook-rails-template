require 'rails_helper'
require 'web_helpers'
require 'capybara'


RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 302" do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to("http://test.host/users/sign_in")
    end

    it "creates a post" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be nil
    end
  end

  describe "GET /" do
    it "responds with 302" do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
