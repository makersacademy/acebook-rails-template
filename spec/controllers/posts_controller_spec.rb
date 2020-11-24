require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before :each do
   User.create({name: "Bob", email: "test@testing243.co.uk", password: "123456"})
   @@test_user_id = User.find_by(email: "test@testing243.co.uk").id
  end
  describe "GET /new " do
    it "responds with 200" do
      skip
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!", user_id: @@test_user_id } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      skip
      post :create, params: { post: { message: "Hey world!", user_id: @@test_user_id }}
      expect(Post.find_by(user_id: @@test_user_id)).to be
    end
  end

  describe "GET /posts" do
    it "responds with 200" do
      skip
      get :index, session: { id: 4567 }
      expect(response).to have_http_status(200)
    end
  end

  @@test_user_id = nil
end
