require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let(:mentor) { create(:mentor) }
  describe "GET /mentor_dashboard" do
    context "after a mentor signs in" do
      before { sign_in mentor }
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  #Also need to add test to check for redirect when someone logged in as a student tries to go to the mentor dashboard

end
