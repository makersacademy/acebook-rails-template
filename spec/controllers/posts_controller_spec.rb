require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET /" do
    it "responds with 200" do
      user = User.create(user_name: 'testUser', email: 'test@test.com', password: "password", password_confirmation: "password")
      sign_in user

      get :index
      expect(response).to have_http_status(200)

      sign_out user
    end
  end

  describe "GET /new " do
    it "responds with 302 if not signed in" do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /new " do
    it "responds with 200 if signed in" do
      user = User.create(user_name: 'testUser', email: 'test@test.com', password: "password", password_confirmation: "password")
      sign_in user

      get :new
      expect(response).to have_http_status(200)

      sign_out user
    end
  end

  describe "POST /" do
    it "responds with 200" do
      user = User.create(user_name: 'testUser', email: 'test@test.com', password: "password", password_confirmation: "password")
      sign_in user
      session[:wall_user_id] = user.id

      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(wall_path(session[:wall_user_id]))

      sign_out user
    end

    it "creates a post" do
      user = User.create(user_name: 'testUser', email: 'test@test.com', password: "password", password_confirmation: "password")
      sign_in user
      session[:wall_user_id] = user.id

      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be

      sign_out user
    end

    # it "checks if editable by different user than owner" do
    #   user = User.create(user_name: 'testUser', email: 'test@test.com', password: "password", password_confirmation: "password")
    #   sign_in user
    #   post :create, params: { post: { message: "Hello, world!" } }
    #   p "User 1"
    #   p user[:id]
    #   sign_out user
    #
    #   user2 = User.create(user_name: 'testUser2', email: 'test2@test.com', password: "password", password_confirmation: "password")
    #   sign_in user2
    #   p "User 2"
    #   p user2[:id]
    #
    #   post = Post.last
    #
    #   expect(post.can_edit(post.id)).to eq true
    #
    #   sign_out user2
    # end
  end
end
