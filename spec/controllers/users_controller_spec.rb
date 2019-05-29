require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /new' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { user: { first_name: "John", last_name: "Doe", email: "john@doe.com", password: "john123456" } }
      expect(response).to redirect_to(login_url)
    end

    it "creates a user" do
      post :create, params: { user: { first_name: "John", last_name: "Doe", email: "john@doe.com", password: "john123456" } }
      expect(User.find_by(email: "john@doe.com")).to be
    end
  end
end
