require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe "GET /posts/new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /posts" do
    it "responds with 200" do

      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(users_path + "/")
    end

    it "creates a post" do

      post :create, params: { post: { message: "Hello, world!", recipient_id: user.id } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /posts" do
    it "responds with 200" do

      get :index
      expect(response).to have_http_status(200)
    end
  end

end
