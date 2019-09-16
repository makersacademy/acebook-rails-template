require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  context 'signed_in' do
    before(:each) { sign_in }

    describe "#new" do
      it "responds with 200" do
        get :new
        expect(response).to have_http_status(200)
      end
    end

    describe "#create" do
      it "responds with 200" do
        post :create, params: { post: { message: "Hello, world!" } }
        expect(response).to redirect_to(posts_url)
      end

      it "creates a post" do
        post :create, params: { post: { message: "Hello, world!" } }
        expect(Post.find_by(message: "Hello, world!")).to be_valid
      end 
    end

    describe "#index" do
      it "responds with 200" do
        get :index
        expect(response).to have_http_status(200)
      end

      it 'renders the index page' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe '#edit' do
      xit "edits a post" do
        post :delete, params: { post: { message: "Hello, world!" } }
        expect(Post.find_by(message: "Hello, world!")).to be_valid
      end
    end

    describe '#update' do
    end
  end

  describe "Destroy" do
    it "can delete its own submitted post" do
      sign_in
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.all.count).to eq 1

      post_id = Post.all.first.id

      delete :destroy, params: { id: post_id }
      expect(Post.all.count).to eq 0      
    end

    it "can't delete a post that doesn't belong to them" do
      sign_in
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.all.count).to eq 1
      sign_out

      post_id = Post.all.first.id

      sign_in
      delete :destroy, params: { id: post_id }
      expect(Post.all.count).to eq 1
    end
  end
end
