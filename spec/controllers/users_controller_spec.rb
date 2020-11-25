require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:valid_attributes) {
    {name: "Test Person", email: "test@testing.com", password: "test1234"}
  }

  let(:invalid_attributes) {
    {name: nil, email: nil, password: nil}
  }

  let(:valid_session) { {} }

  describe "GET #show" do
    it "returns a success response" do
      # NOTE: Rewrite test before using 'Show' path
      # user = User.create! valid_attributes
      # get :show, params: {id: user.to_param}, session: valid_session
      # expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: {user: valid_attributes}, session: valid_session
        }.to change(User, :count).by(1)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {user: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: "New Person", email: "new@testing.com", password: "test1234"}
      }

      it "updates the requested user" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
        user.reload
        expect(user.name).to eq("New Person")
        expect(user.email).to eq("new@testing.com")
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, params: {id: user.to_param}, session: valid_session
      }.to change(User, :count).by(-1)
    end
  end

end
