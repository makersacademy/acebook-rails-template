require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before(:each) do
    @user = create(:user)
    sign_in(@user)
  end

  describe "GET /show" do
    it "responds with 200" do
      get :show, params: {id: @user.id}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /index" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end



end
