require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  
  # before(:each) do 
  #   sign_in(user)
  # end 
  
  describe "GET / " do
    it "responds with 200" do
      user = FactoryBot.create(:user)
      new_post = FactoryBot.create(:post) 
      sign_in(user)
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      user = FactoryBot.create(:user)
      new_post = FactoryBot.create(:post) 
      sign_in(user)
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      user = FactoryBot.create(:user)
      new_post = FactoryBot.create(:post) 
      sign_in(user)
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      user = FactoryBot.create(:user)
      new_post = FactoryBot.create(:post) 
      sign_in(user)
      get :index
      expect(response).to have_http_status(200)
    end
    it "show returns 200" do
      user = FactoryBot.create(:user)
      new_post = FactoryBot.create(:post) 
      sign_in(user)
      #post :create, params: { post: { message: "Hello, world!", id: 2 } }
      #post = Post.create message: "hello", id: 2
      post = new_post
      get :show, params: { id: post.id }
      expect(response).to have_http_status(200)
    end

    it "edit responds with 200" do
      user = FactoryBot.create(:user)
      new_post = FactoryBot.create(:post) 
      sign_in(user)
      post = new_post
      #post = Post.create message: "hello"
      get :edit, params: {id: post.id}
      expect(response).to have_http_status(200)
    end

    # it "update method changes post" do
    #   post = Post.create message: "hello"
    #   get :edit, params: {id: post.id, message: "bye"}
    #   # patch :update, params: {id: post.id, message: "bye"}
    #   expect(Post.find_by(message: "bye")).to be
    # end
  end

  # describe "PUT update/:id" do
  #   it "allows post to be updated" do
  #     @post = Post.create message: "hello"
  #     put :update, params: { id: @post.id, message: "Bye" }
  #     expect(response).to be_redirect
  #   end
  # end

  describe "DELETE" do  
    it 'responds with 200' do 
      post = Post.create message: "hello world"
      post.destroy
      expect(response).to have_http_status(200)
    end 
    # it 'should delete a post' do
    #   sign_in(user)
    #   new_post = post
    #   expect { new_post.destroy }.to change(Post, :count).by(-1) 
    # end 
   end 
end
