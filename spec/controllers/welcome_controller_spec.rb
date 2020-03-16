require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      sign_up
      get :index
      expect(response).to have_http_status(302)
    end
  end

end
