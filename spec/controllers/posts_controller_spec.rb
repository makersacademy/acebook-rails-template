require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      fill_in_database
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      fill_in_database
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "orders posts in reverse order" do
      fill_in_database
      fill_in_database_again
      expect(Post.all.order("created_at DESC")[0][:message]).to eq("Second post")
    end
  end
end
