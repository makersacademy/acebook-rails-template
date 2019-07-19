require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  # before(:each) do
  #   visit "/"
  #   click_link "Sign up"
  #   fill_in "Email", with: "tesymcemail@email.com"
  #   fill_in "Password", with: "password"
  #   fill_in "Password confirmation", with: "password"
  #   click_button "Sign up"
  # end

  describe "GET /new " do
    xit "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    xit "responds with 200" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    xit "creates a post" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    xit "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
