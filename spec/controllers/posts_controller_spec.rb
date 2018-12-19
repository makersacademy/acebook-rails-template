require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:user) { FactoryBot.create(:user) }

  before :each do
    login_as(user, scope: :user)
  end

  describe "GET / " do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "creates a post" do
      post :create, params: { post: { title: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end
  end

end
