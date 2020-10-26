require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  
  before(:each) do 
    user = FactoryBot.create(:user)
    @new_post = FactoryBot.create(:post) 
    sign_in(user)
  end 
  
  describe "GET / " do
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
    it "show returns 200" do
      get :show, params: { id: @new_post.id }
      expect(response).to have_http_status(200)
    end

    it "edit responds with 200" do
      get :edit, params: {id: @new_post.id}
      expect(response).to have_http_status(200)
    end

    it "update method changes post" do
      patch :update, params: {id: @new_post.id, post: { message: "bye" } }
      expect(Post.find_by(message: "bye")).to be
    end
  end

  describe "PUT update/:id" do
    it "allows post to be updated" do
      patch :update, params: { id: @new_post.id, post: { message: "Bye" } }
      expect(response).to be_redirect
    end
  end

  describe "DELETE" do  
    it 'responds with 200' do
      expect(response).to have_http_status(200)
    end 
    it 'should delete a post' do
      expect { @new_post.destroy }.to change(Post, :count).by(-1) 
    end 
   end 
end
