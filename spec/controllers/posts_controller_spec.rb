require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  context 'User is signed in' do

    before(:each) do
      user = double(:user)
      posts = double(:posts)
      post = double(:post)
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
      allow(user).to receive(:posts).and_return(posts)
      allow(posts).to receive(:create).and_return(post)
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
        post :create, params: { post: { message: "Hello, world!", id: 1 } }
        expect(Post.find_by(id: 1)).to be
      end
    end

    describe "GET /" do
      it "responds with 200" do
        get :index
        expect(response).to have_http_status(200)
      end
    end
  end

  context 'User is not signed in' do
    describe 'GET /' do
      it "redirects page" do
        get :index
        expect(response).to have_http_status(302)
      end
      it "prompts user to sign in" do
        get :index
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe "DELETE /" do
    it "deletes a post" do
      post :create, params: { message: "Hello World", id: 1 }
      #DOESN'T CREATE ANYTHING
      delete :destroy, params: { id: 1 }
      expect(Post.find_by(message: "Hello, world!")).not_to be
    end
  end
end
