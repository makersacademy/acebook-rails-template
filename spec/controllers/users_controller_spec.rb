require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before(:each) do
    request.env["HTTP_REFERER"] = root_url
    @user = User.new(:email => 'el@el.com', :password => '1234567')
    @user.save
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "assign user return as @user" do
      get :show, params: { id: @user.id }
    end
  end

  describe "GET #edit" do
    it "assigns the requested user as @user" do
      get :edit, params: { id: @user.id }
      assigns(:user).should eq(@user)
    end
  end

  describe "PUT #update" do
    it "updates the requested user" do
      put :update, :params => {:id => @user.id, :user => @user.attributes = { :email => "new@new.com", :password => "qwertyu" }}
      expect(@user.email).to eq("new@new.com") 
      expect(response).to redirect_to root_url
      # expect(response).to redirect_to ('/')
    end
  end

end
