# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'creates a new user' do
      get :create, params: { users:
        {
          username: 'oss',
          email: 'ossemail@gmail.com',
          password: '123'
        } }
      expect(User.find_by(username: 'oss')).to be
    end
  end
end
