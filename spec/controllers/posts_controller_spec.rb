require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      allow(User).to receive(:find_by).and_return({ user: { name: 'Bob', email: 'bob@test.com' }})
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      allow(User).to receive(:find_by).and_return({ user: { name: 'Bob', email: 'bob@test.com' }})
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end
  end

  describe "GET /" do
    it "responds with 200" do
      allow(User).to receive(:find_by).and_return({ user: { name: 'Bob', email: 'bob@test.com' }})
      get :index
      expect(response).to have_http_status(200)
    end

    it "if user not signed in you get redirected to the homepage" do
      get :index
      expect(response).to redirect_to(welcome_url)
    end

  end

  describe "GET /posts/:id/edit" do
    it "reesponds with 200" do
      allow(User).to receive(:find_by).and_return({ user: { name: 'Bob', email: 'bob@test.com', id: 1 }})
      allow(Post).to receive(:find_by).and_return({ post: { id: 1, message: "potatoes are good", created_at: "", updated_at: "nil", user_id: 1 }})
      get :posts/1/edit 
      expect(response).to have_http_status(200)
    end
  end
end
