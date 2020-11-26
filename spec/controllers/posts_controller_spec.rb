require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before :each do
   allow(controller).to receive(:authenticate_request) { true }
   User.create({name: "Bob", email: "test@testing243.co.uk", password: "123456"})
   @@test_user_id = User.find_by(email: "test@testing243.co.uk").id
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!", user_id: @@test_user_id } }
      expect(response).to have_http_status(200)
    end

    it "creates a post" do
      post :create, params: { post: { message: "Hey world!", user_id: @@test_user_id }}
      expect(Post.find_by(user_id: @@test_user_id)).to be
    end
  end

  describe "GET /posts" do
    it "responds with 200" do
      get :index, session: { id: 4567 }
      expect(response).to have_http_status(200)
    end
  end

  @@test_user_id = nil
end
