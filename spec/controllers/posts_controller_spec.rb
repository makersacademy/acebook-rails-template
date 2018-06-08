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
        expect { post :create, params: { post: { message: 'Hello World!'} } }.to change{ Post.count }.by(1)
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
        expect{ delete :destroy, params: { id: @post.id } }.to change{ Post.count }.by(-1)
      end
    end

    describe "UPDATE /", :update do
      let(:update_post) do { message: 'Changed Message' }
      end
      it "updates a post" do
        # @post = attributes_for(:post)
        # post :create, params: { post: @post }
        # @post = Post.create(message: 'Changed Message')
        # p Post.all
        # get :update, params: { :id => @post.id, :post => update_post }
        # p Post.all

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
