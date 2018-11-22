require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET /new " do
    before do

    end

    let(:current_user) { double :current_user }
    it "responds with 200" do
      allow(current_user).to receive(:id).and_return(1)
      get :new
      expect(response).to have_http_status(200)
    end
  end

  # describe "POST /" do
  #   let(:current_user) { double :current_user }
  #   it "responds with 200" do
  #     allow(current_user).to receive(:id).and_return(2)
  #     post :create, params: { post: { message: "Hello, world!"} }
  #     expect(response).to redirect_to(posts_url)
  #   end
  #
  #   it "creates a post" do
  #     allow(current_user).to receive(:id).and_return(3)
  #     post :create, params: { post: { message: "Hello, world!"} }
  #     expect(Post.last.message).to eq("Hello, world!")
  #   end
  # end

  describe "GET /" do
    let(:current_user) { double :current_user }
    it "responds with 200" do
      allow(current_user).to receive(:id).and_return(4)
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
