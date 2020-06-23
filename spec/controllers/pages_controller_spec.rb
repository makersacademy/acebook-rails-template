require 'rails_helper'

RSpec.describe PagesController, type: :controller do
let(:user) { create(:user) }

  describe "GET #home" do
    context "after signing in" do
      before { sign_in user }
      it "returns http success" do
        get :home
        expect(response).to have_http_status(200)
      end
    end

    context "after signing in" do
      it "redirects to sign in page" do
        get :home
        assert_response :redirect
      end
    end
  end
end
