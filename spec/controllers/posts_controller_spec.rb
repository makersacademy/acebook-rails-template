require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before :each do
    User.create({name: "Bob", email: "test@testing243.co.uk", password: "123456"})
    @@test_user_id = User.find_by(email: "test@testing243.co.uk").id
  end
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      puts"-----------------------------"
      post :create, params: { post: { message: "Hello, world!" }}
      puts"-----------------------------"

      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index, session: { id: 4567 }
      expect(response).to have_http_status(200)
    end
  end
end
