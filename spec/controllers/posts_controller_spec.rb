require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      user = User.create(email: "new@gmail.com", password: "password", password_confirmation: "password")
      sign_in user
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      user = User.create(email: "new@gmail.com", password: "password", password_confirmation: "password")
      sign_in user
      post :create, params: { post: { message: "Hello, world!" }, wall_id: "" }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      user = User.create(email: "new@gmail.com", password: "password", password_confirmation: "password")
      sign_in user
      post :create, params: { post: { message: "Hello, world!" }, wall_id: "" }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      user = User.create(email: "new@gmail.com", password: "password", password_confirmation: "password")
      sign_in user
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /" do
    it "responds with 200" do
      user = User.create(email: "new@gmail.com", password: "password", password_confirmation: "password")
      sign_in user
      post :create, params: { post: { message: "Hello, world!" }, wall_id: "" }
      delete :delete, format: user.posts.first.id
      expect(Post.find_by(message: "Hello, world!")).not_to be
    end
  end

  describe "POST /update " do
    it "updates a post" do
      user = User.create(email: "new@gmail.com", password: "password", password_confirmation: "password")
      sign_in user
      post :create, params: { post: { message: "Hello, world!" }, wall_id: "" }
      post :update, params: { id: user.posts.first.id.to_s, post: { message: "Goodbye, world!" }, use_route: "/user/" + user.id.to_s + "/posts/" + user.posts.first.id.to_s + "/edit" }
      expect(Post.find_by(message: "Hello, world!")).not_to be
      expect(Post.find_by(message: "Goodbye, world!")).to be
    end
  end
end
