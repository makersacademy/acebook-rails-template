require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

 describe "POST #create", type: :controller do

 let(:invalid_params) { {fname: "Will", lname: "Man", email: "will@man.com", password: "123"} }
 let(:valid_session) { {} }

  context "when invalid params" do
    it "redirects to root page" do
      post :create, params: {user: invalid_params}, session: valid_session

      expect(response.location).to eq "http://test.host/"
    end
  end
end


  # # This should return the minimal set of attributes required to create a valid
  # # User. As you add validations to User, be sure to
  # # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   { handle: "Kay", password: "rockhudson" }
  # }
  #
  # let(:invalid_attributes) {
  #   { handle: nil }
  # }

  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # UsersController. Be sure to keep this updated too.
  # let(:valid_session) { {} }
  #
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new User" do
  #       expect {
  #         post :create, params: {user: valid_attributes}, session: valid_session
  #       }.to change(User, :count).by(1)
  #     end
  #
  #     it "renders a JSON response with the new user" do
  #       post :create, params: {user: valid_attributes}, session: valid_session
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to eq('application/json')
  #       user = User.last
  #       expect(JSON.parse(response.body)).to eq({
  #         "id" => user.id,
  #         "handle" => user.handle
  #       })
  #       expect(response.location).to eq(user_url(user))
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "renders a JSON response with errors for the new user" do
  #       post :create, params: {user: invalid_attributes}, session: valid_session
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end
  #
  #   context "with a duplicate handle" do
  #     it "renders a JSON response with errors for the new user" do
  #       post :create, params: {user: valid_attributes}, session: valid_session
  #       post :create, params: {user: valid_attributes}, session: valid_session
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end
  end
