require 'rails_helper'
# require 'spec_helper'

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
      User.create(email: "test@example.com", password: "123456")
      session[:current_user_id] = User.last.id
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end
    it "creates a post" do
      User.create(email: "test@example.com", password: "123456")
      session[:current_user_id] = User.last.id
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 302" do
      sign_up
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
