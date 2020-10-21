require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # TODO: add back after we have login test helper and this should be a post test
  # describe "POST #create" do
  #   it "returns http success" do
  #     post :create
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # TODO: Uncomment test later once login is implemented
  # describe "GET #login" do
  #   it "returns http success" do
  #     get :login
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #welcome" do
    it "returns http success" do
      get :welcome
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #logout" do
    it 'returns user to the welcome page' do
      post :logout
      expect(response).to redirect_to(welcome_url)
    end
  end

end
