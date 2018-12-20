require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:user) { FactoryBot.create(:user) }

  describe "When user NOT Logged IN" do

    describe "GET /new " do
      it "responds with 200" do
        get :new
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "When Logged IN" do

    before :each do
      login_as(user, scope: :user)
    end

    describe "GET /index " do
      it "responds with 200" do
        get :index
        expect(response).to have_http_status(200)
      end
    end

    describe "GET /posts/:id " do
      it "responds with 200" do
        post = FactoryBot.create(:post)
        get :show, params: { id: post.id }
        expect(response).to have_http_status(200)
      end
    end

    describe "GET /new " do
      it "responds with 200" do
        get :new
        expect(response).to have_http_status(200)
      end
    end

    describe "POST /" do
      it "creates a post" do
        post :create, params: { post: { message: 'Hello, world!' } }
        expect(response).to redirect_to(posts_url)
      end
    end

    after :all do
      logout
    end

  end

end
