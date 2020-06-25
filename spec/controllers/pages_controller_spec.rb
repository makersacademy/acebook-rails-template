require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET #welcome" do
    context "user receives a 200 when going to the root route" do
      it "returns http success" do
        get :welcome
        expect(response).to have_http_status(200)
      end
    end
  end
end
