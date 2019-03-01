require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  def setup
    sign_in User.find_by_id(1)
  end

  describe "GET #index" do
    it "returns http success" do
      setup
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new post" do
      setup
      # calls the create *method* (not the route) in the controller
      post :create, params: { post: { message: 'Test message ahoo' } }
      expect(Post.last.message).to eq('Test message ahoo')
      expect(response).to have_http_status(302) # a redirect
    end
  end

  describe "PUT #index" do
    it "updates a new post" do
      setup
      post :create, params: { post: { message: 'Test message ahoo' } }
      post_id = Post.last.id
      put :update, params: { id: post_id, updated_post: { message: 'This is updated' } }
      expect(Post.find(post_id).message).to eq('This is updated')
    end
  end

end
