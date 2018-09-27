require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "user not logged in" do
    describe "GET #index" do
      it "returns http redirect to log in page" do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
