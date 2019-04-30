# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    xit "responds with 200" do
      session[:user_id] = 1
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    xit "responds with 200" do
      user = User.create(email: "test@email.com", password: "123456")
      session[:user_id] = user.id
      post :create, params: { post: { message: "Hello, world!", author_id: session[:user_id] } }
      expect(response).to redirect_to(posts_url)
    end

    xit "creates a post" do
      user = User.create(email: "test@email.com", password: "123456")
      session[:user_id] = user.id
      post :create, params: { post: { message: "Hello, world!", user_id: session[:user_id] } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end

    xit "post has a user_id" do
      user = User.create(email: "test@email.com", password: "123456")
      session[:user_id] = user.id
      post :create, params: { post: { message: "Hello, world!", author_id: session[:user_id] } }
      check = Post.find_by(message: "Hello, world!")
      expect(check.author_id).to be(session[:user_id])
    end
  end

  describe "GET /" do
    xit "responds with 200" do
      session[:user_id] = 1
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
