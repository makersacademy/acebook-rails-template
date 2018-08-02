require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET /users/new" do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do

    before(:each) do
      post :create, params: { user: { first_name: "Elishka", last_name: "Flint", email: "elishka@keepitrails.com", password: "pas55w0rd" }}
    end

    it "responds with 200" do
      expect(response).to redirect_to("/users/#{assigns(:user).id}")
    end

    it "creates a user" do
      expect(User.find_by(email: "elishka@keepitrails.com")).to be
    end
  end

  describe "GET /users/:id" do

    before(:each) do
      @user = User.create(first_name: "test first name", last_name: "test last name", email: "test@test.com", password: "pa55w0rd")
    end

    it 'responds with 200' do
      get :show, params: { user_id: @user.id }
      expect(response).to redirect_to user_path(@user)
    end

  end

end
