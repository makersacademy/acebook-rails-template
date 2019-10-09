require 'rails_helper'

describe PostsController do
  login_user
  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end
end

  describe PostsController, type: :controller do
  describe "GET /new " do
    login_user
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    login_user
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    login_user
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
