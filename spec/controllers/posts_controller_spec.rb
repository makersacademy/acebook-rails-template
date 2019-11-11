require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before :each do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  # describe "POST /" do
  #   it "responds with 200" do
  #     post :create, params: { post: { message: "Hello, world!" } }
  #     expect(response).to redirect_to(posts_url)
  #   end

  #   it "creates a post" do
  #     post :create, params: { post: { message: "Hello, world!" } }
  #     expect(Post.find_by(message: "Hello, world!")).to be
  #   end
  # end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET :id/edit' do
    it 'goes to the edit page' do
      post = Post.create(message: "Hello", user_id: @user.id)
      params = { id: post.id }
      get :edit, params: params
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH/:id' do
    it 'updates the post' do
      post = Post.create(message: "Hello, world!", user_id: @user.id)
      params = { :post => { message: "Bye" }, id: post.id }
      patch :update, params: params
      expect(Post.all.first.message).to eq "Bye"
    end
  end

  describe "DELETE/:id" do
    it "deletes a post" do
      wall_id = 1
      post = Post.create(message: "Hello, world!", user_id: @user.id, wall_id: wall_id )
      params = { :post => {receiver: wall_id }, id: post.id}
      delete :destroy, params: params
      expect(Post.all.length).to eq 0
    end
  end
end
