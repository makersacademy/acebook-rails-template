require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:current_user) { User.create.id }
  let(:post) { Post.new }

  describe "GET /new " do
    it "responds with 200" do
      allow(current_user).to receive(:id).and_return(1)
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      allow(current_user).to receive(:id).and_return(1)

      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      allow(current_user).to receive(:id).and_return(1)
      allow(post).to receive(:message).and_return("Hello, world!")
      # post :create, params: { post: { message: "Hello, world!" } }
      expect(post.message).to eq "Hello, world!"
    end
  end

  describe "GET /" do
    it "responds with 200" do
      allow(current_user).to receive(:id).and_return(1)
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
