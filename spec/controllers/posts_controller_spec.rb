require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:current_user) { double :current_user }
  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      User.create(name: "Alex", email: "alex@alex.com", password: "Alex123", password_confirmation: "Alex123")
      user = User.find_by(name: "Alex")
      allow(User).to receive(:find_by).and_return({ user: {name: "Alex", email: "alex@alex.com" }})
      # allow(:current_user).to receive(:id).and_return(1)
      post :create, params: { post: { message: 'Hello, world!', user_id: user.id } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(Post.find_by(message: 'Hello, world!')).to be
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
