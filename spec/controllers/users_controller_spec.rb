require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { user: { username: "lotty", password: "password12"  } }
      expect(response).to redirect_to(posts_url)
    end
  end
    it "creates a post" do
      post :create, params: { user: { username: "lotty", password: "password12"  } }
      expect(User.find_by(username: "lotty")).to be
    end
  

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

end