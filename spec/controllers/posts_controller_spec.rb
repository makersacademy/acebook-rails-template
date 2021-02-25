# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    user.confirm! #if you are using the "confirmable" module
    sign_in user
  end
  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(Post.find_by(message: 'Hello, world!')).to be
    end

    it 'creates a post with a date' do
      post :create, params: { post: { message: "Today's date is:" } }
      expected_result = Post.find_by(message: "Today's date is:").updated_at
      expect(Time.zone.now - expected_result).to be < 1
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
