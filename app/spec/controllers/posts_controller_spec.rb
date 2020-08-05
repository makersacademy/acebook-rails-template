require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new no login " do
    it "redirects to the welcome page" do
      get :new
      expect(response).to redirect_to('/welcome')
    end
  end

  describe "GET /new with login " do
    xit "responds with 200" do
      get :new

      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
  #   it "responds with 200" do
  #     post :create, params: { post: { message: "Hello, world!" } }
  #     expect(response).to redirect_to(posts)
  #   end

    xit "creates a post" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  xdescribe "GET /" do
    xit "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
