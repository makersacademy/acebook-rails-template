require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  controller_login_user
  describe 'GET / ' do
    it 'responds with 200 when logged in' do
      get :show
      expect(response).to have_http_status(200)
    end
  end
end
