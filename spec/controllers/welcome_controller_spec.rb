require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #index" do
    it "returns http success if logged in" do
      user = create(:user)
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
