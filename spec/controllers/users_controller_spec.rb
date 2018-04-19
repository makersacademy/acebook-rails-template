# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = User.create!(
      username: 'testUser',
      email: 'user@test.com',
      password: 'please',
      password_confirmation: 'please'
    )
    sign_in @user
  end

  describe 'GET/ #show' do
    it 'returns http success' do
      get :show, params: { id: @user.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the :show template' do
      get :show, params: { id: @user.id }
      expect(response).to render_template :show
    end
  end
end
