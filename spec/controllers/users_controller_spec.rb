require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create", type: :controller do

    let(:invalid_params) { { fname: "Will", lname: "Man", email: "will@man.com", password: "123" } }
    let(:valid_session) { {} }

    context "when invalid params" do
      it "redirects to root page" do
        post :create, params: { user: invalid_params }, session: valid_session

        expect(response.location).to eq "http://test.host/"
      end
    end
  end

end
