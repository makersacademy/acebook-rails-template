require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET /sessions/new' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    # it 'valid user created - responds with 200' do
    #   # Need to stub the user authenticate method
    #   post :create, params: { post: { name: 'Lisa', email: 'list@list.com', password: 'password' } }
    #   expect(response).to redirect_to(posts_url)
    # end

    it 'invalid user entered' do
      post :create, params: { post: { name: 'Lisa', email: 'list@list.com', password: 'pass' } }
      expect(response).to redirect_to(new_session_url)
    end
  end
end
