require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  before(:all) do
    FactoryBot.define do
      factory :user do
        email { "test@email.com" }
        password  { "testtest" }
        username { "testusername" }
      end
    end
  end

  describe "POST /" do
    before(:each) do
      user = create(:user)
      sign_in user
    end


    it "redirects to index" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates an entry in the database" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
      expect(User.find_by(username: "testusername")).to be
    end
  end

  describe "GET /" do
    it "index responds with 302 (redirect) when not logged in" do
      get :index
      expect(response).to have_http_status(302)
    end

    it "index responds with 200 when logged in" do
      user = create(:user)
      sign_in user

      get :index
      expect(response).to have_http_status(200)
    end

  end


end
