require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params:
        {
          user:
            {
              firstname: 'Bob',
              lastname: 'Marley',
              username: 'bm',
              email: 'bob@bobmarley.com',
              password: 'bobbob'
            }
        }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a new user' do
      post :create, params:
        {
          user:
            {
              firstname: 'Bob',
              lastname: 'Marley',
              username: 'bm',
              email: 'bob@bobmarley.com',
              password: 'bobbob'
            }
        }
      expect(User.find_by(username: 'bm')).to be
    end
  end
end
