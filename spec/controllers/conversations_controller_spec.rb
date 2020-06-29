require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do
  let(:mentor) { create(:mentor) }
  let(:student) { create(:student) }
  describe "GET /conversations" do
    context "after a mentor signs in" do
      before { sign_in mentor }
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET /conversations" do
    context "after a student signs in" do
      before { sign_in student }
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end
