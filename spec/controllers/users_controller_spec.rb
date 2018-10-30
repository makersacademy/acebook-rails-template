require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET /id" do
    context "param id given" do
      it "responds with 200" do
        get :show, params: {id: 1}
        expect(response).to have_http_status(200)
      end
    end
  end

end
