require 'rails_helper'

RSpec.describe PostsController, type: :controller do

# create a user before each test is run

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.new(id: 1))
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

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect {
        delete :destroy, params: { id: post.to_param }, session: valid_session
      }.to change(Post, :count).by(-1)
    end

    # it "redirects to the photos list" do
    #   photo = Photo.create! valid_attributes
    #   delete :destroy, params: { id: photo.to_param }, session: valid_session
    #   expect(response).to redirect_to(photos_url)
    # end
  end

end
