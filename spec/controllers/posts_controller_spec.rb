require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "POST /" do
    xit "responds with 200" do
      sign_in
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end
  end

  describe "GET /" do
    xit "responds with 302" do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
