require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { create(:user) }

  describe "GET /users/:id" do
    it "responds with 200" do
      sign_in user
      get :show, params: { id: user.id }
      expect(response).to have_http_status(200)
    end
  end

end
