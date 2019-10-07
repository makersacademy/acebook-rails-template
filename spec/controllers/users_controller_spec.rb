require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "Get /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "Get /new" do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end
end
