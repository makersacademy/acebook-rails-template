require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe "create" do
  #   it "creates a user" do
  #     post :create, params: { name: "Ben", email: "ben@gmail.com", password: "1234", password_confirmation: "1234"}
  #     expect(User.find_by(email: "ben@gmail.com")).to be
  #   end
  # end

  # describe "POST /signup" do
  #   it "creates a user and redirects to home page" do
  #     post :create, params: { name: "Ben", email: "ben@gmail.com", password: "1234"}
  #     expect(response).to redirect_to('/posts')
  #   end

  #   it "creates a user and stores in database" do
  #     post :create, params: { name: "Ben", email: "ben@gmail.com", password: "1234", password_confirmation: "1234"}
  #     expect(User.find_by(email: "ben@gmail.com")).to be
  #   end
  # end

end
