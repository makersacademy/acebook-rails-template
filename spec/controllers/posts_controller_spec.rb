require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  # let(:wall) { FactoryBot.create(:wall) }

  before(:each) do
    sign_in
  end

  # test controller for editing post
  describe 'GET /edit' do
    it 'render the edit post page' do
      post = FactoryBot.create(:post)
      get :edit, params: { id: post.id }
      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH /update" do
    it "render the post index page when coming from post index" do
      post = FactoryBot.create(:post)
      session[:return_to] = posts_path
      patch :update, params: { id: post.id, post: { message: "random message" } }
      expect(response).to redirect_to(posts_path)
    end

    it "render the wall page when coming from wall" do
      post = FactoryBot.create(:post)
      session[:return_to] = user_wall_path(user)
      patch :update, params: { id: post.id, post: { message: "random message" } }
      expect(response).to redirect_to(user_wall_path(user))
    end

    it "update the entry in database" do
      post = FactoryBot.create(:post)
      session[:return_to] = posts_path
      patch :update, params: { id: post.id, post: { message: "random message after update" } }
      updated_post = Post.find(post.id)
      expect(updated_post.message).to eq("random message after update")
    end
  end

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      user.create_wall!
      post :create, params: { post: { message: "Hello, world!" } }, session: { host_user_id: user.id, return_to: posts_url }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      user.create_wall!
      post :create, params: { post: { message: "Hello, world!" } }, session: { host_user_id: user.id, return_to: posts_url }
      expect(Post.find_by(message: "Hello, world!")).to be_truthy
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'renders the index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "Destroy" do
    it "can delete its own submitted post" do
      request.env['HTTP_REFERER'] = posts_url
      user.create_wall!
      post :create, params: { post: { message: "Hello, world!" } }, session: { host_user_id: user.id, return_to: posts_url }
      expect(Post.all.count).to eq 1

      post_id = Post.all.first.id
      # allow(current_user).to receive(:id).and_return(1)

      delete :destroy, params: { id: post_id }
      expect(Post.all.count).to eq 0
    end

    it "can't delete a post that doesn't belong to them" do
      request.env['HTTP_REFERER'] = posts_url
      user.create_wall!
      post :create, params: { post: { message: "Hello, world!" } }, session: { host_user_id: user.id, return_to: posts_url }
      sign_out

      post_id = Post.all.first.id

      sign_in
      delete :destroy, params: { id: post_id }
      expect(Post.all.count).to eq 1
    end
  end
end
