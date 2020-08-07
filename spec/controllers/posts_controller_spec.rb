require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET /new ' do
    it 'responds with 302 when not logged in' do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /' do
    it 'responds with 200 when not logged in' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

end

