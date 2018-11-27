require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  #   it 'creates a new session' do
  #     post :create, params: {}
  #   end
  #ASK ED
  end
end
