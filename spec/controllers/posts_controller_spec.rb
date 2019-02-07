require_relative '../helpers/users_helper_spec'

RSpec.describe PostsController, type: :controller do

  describe "GET /new " do
    it "responds with 200" do
      create_user
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      create_user
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      create_user
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      create_user
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
