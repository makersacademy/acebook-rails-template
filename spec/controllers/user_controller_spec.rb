require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe 'Posts' do
    describe "GET posts#index" do
      context "when the user is logged in" do
        it "should render posts#index" do
        end
      end

      context "when the user is logged out" do
        it "should redirect to the login page" do
        end
      end
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe "create" do
  #   it "creates a user" do
  #     get :new
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
