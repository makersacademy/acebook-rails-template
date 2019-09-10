require "rails_helper"

RSpec.describe WelcomeController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      User.create(email: "new@gmail.com", password: "password", password_confirmation: "password")
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
