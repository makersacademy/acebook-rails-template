require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }

  describe "a signed in user" do
    context "after signing in" do
      before {sign_in user.user}

      it "can visit post index" do
        
        expect(response).to have_http_status(200)
      end
    end
  end
end

