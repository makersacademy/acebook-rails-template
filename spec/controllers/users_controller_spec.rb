require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "" do
    it "GET /" do
      user = create(:user)
      sign_in user
      get :show, params: { id: user.id }
      expect(response).to have_http_status(200)
    end
  end
end
