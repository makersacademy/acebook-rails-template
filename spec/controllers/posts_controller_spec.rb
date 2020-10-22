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
    it "responds with 200" do
      allow(User).to receive(:find_by).and_return({ user: { name: 'Bob', email: 'bob@test.com', id: 1 }})
      allow(Post).to receive(:find).and_return({ post: { id: 1, message: "potatoes are good", created_at: "", updated_at: "nil", user_id: 1 }})
  
      get :edit, params: { id: 1 }
      expect(response).to have_http_status(200)
    end
  end

  # TODO - write controller test for patch
  # describe "PATCH /posts/:id" do 
  #   it "will redirect" do
  #     allow(User).to receive(:find_by).and_return({ user: { name: 'Bob', email: 'bob@test.com', id: 1 }})
  #     allow(Post).to receive(:find).and_return({ post: { id: 1, message: "potatoes are good", created_at: "", updated_at: "nil", user_id: 1 }})
  #     post = Post.find()
  #     # patch :update,  params: {message: "potatoes are really good"}
  #     patch post_url(id: 1), params: { post: { message: "potatoes are really good" } }
  #     expect(response).to redirect_to(root_url)
      
  #   end
  # end
end
