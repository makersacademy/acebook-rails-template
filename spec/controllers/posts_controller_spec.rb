require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  before(:each) do
    allow(subject).to receive(:redirect_if_user_is_not_signed_in).and_return(nil)
    allow(subject).to receive(:current_user).and_return(create(:user))
  end

  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!", user_id: 1} }
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

  describe "PUT / :id " do

    it 'verify the PUT request url' do
      post = create(:post, id: 4, message: "Hello, world!", user_id: 1)
      post.update(message: "hello")
      expect(put: 'posts/4').to route_to(controller: 'posts', action: 'update', id: "4")
    end

    it 'updates a post' do
      post = create(:post, id: 4, message: "Hello, world!", user_id: 1)
      post.update(message: "hello")
      expect(post.message).to eq("hello")
      expect(Post.find_by(message: "hello")).to be
    end

  end

end
