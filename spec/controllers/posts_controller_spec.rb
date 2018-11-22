require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:current_user) { double :current_user }

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
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
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
