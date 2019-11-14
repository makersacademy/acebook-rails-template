require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  controller_login_user
  describe 'GET / ' do
    it 'responds with 200 when logged in' do
      params = { id: @user.id }
      get :show, params: params
      expect(response).to have_http_status(200)
    end
  end
end
