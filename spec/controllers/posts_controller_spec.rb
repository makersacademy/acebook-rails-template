require 'rails_helper'
require 'spec_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      visit "/users/new"
      fill_in "Email", with: "test@example.com"
      fill_in "Password", with: "password"
      click_button "Submit"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      sign_up
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      sign_up
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      sign_up
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
