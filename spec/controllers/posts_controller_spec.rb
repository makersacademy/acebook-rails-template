require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  context 'User is signed in' do

    before(:each) do
      @user = create(:user)
      sign_in(@user)
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
        expect { post :create, params: { post: { message: 'Hello World!' } } }.to change { Post.count }.by(1)
      end
    end

    describe "GET /" do
      it "responds with 200" do
        get :index
        expect(response).to have_http_status(200)
      end
    end

    describe "DELETE /" do
      it "deletes a post" do
        @post = create(:post)
        expect { delete :destroy, params: { id: @post.id } }.to change { Post.count }.by(-1)
      end
    end

    describe "UPDATE /", :update do
      it "responds with 200" do
        @post = create(:post)
        put :update, params: { post: { message: 'Test' }, id: @post.id }
        @post.reload.message
        expect(@post.message).to eq('Test')
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
end
