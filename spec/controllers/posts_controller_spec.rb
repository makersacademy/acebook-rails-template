require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:logged_in_user) { User.create(email: "a@a.com", password: "abc123") }
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(logged_in_user)
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
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /destroy" do
    it "deletes a post" do
      @post = Post.create(message: "Hello, world!", user: logged_in_user)
      expect {
        delete :destroy, params: { id: @post.id }
      }.to change(Post, :count).by(-1)
    end
  end

  describe "EDIT /update" do
    it "edits a post" do
      @post = Post.create(message: "Hello, world!", user: logged_in_user)
      put :update, params: { id: @post.id, post: { message: 'Have a great day!' } }
      expect(Post.find_by(message: "Have a great day!")).to be
    end

    context 'when the user is not the owner of the post' do
      let(:post_creator) { User.create(email: 'lala@lala.it', password: 'lalal') }

      it "does not update the post" do
        @post = Post.create(message: "Hello, world!", user: post_creator)
        put :update, params: { id: @post.id, post: { message: 'Have a great day!' } }
        expect(Post.find_by(message: "Have a great day!")).to be nil
      end
    end
  end

end
