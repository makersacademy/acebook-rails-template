require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET /new' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'redirects to the wall of the user ' do
      user = User.create(name: "Gina", password: "123456", email: "gina@example.com")
      post :create, params: { session: { name: "Gina", password: "123456" } }
      expect(response).to redirect_to user_path(user.id)
    end
  end
end
