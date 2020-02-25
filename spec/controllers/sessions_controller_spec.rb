require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
#
#   describe "DELETE #destroy" do
#     it "destroys the user session" do
#       user = User.create!
#       user.destroy
#       expect(session[:user_id]).to eq(1)
#     end
#     # it "redirects to the users list" do
#     #   user = User.create! valid_attributes
#     #   delete :destroy, params: {id: user.to_param}, session: valid_session
#     #   expect(response).to redirect_to(users_url)
#     # end
#   end
#
end
