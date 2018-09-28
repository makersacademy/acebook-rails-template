require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "user not logged in" do
    describe "GET /new " do
      it "responds with 302" do
        get :new
        expect(response).to have_http_status(302)
      end
    end

    describe "GET /" do
      it "responds with 302" do
        get :index
        expect(response).to have_http_status(302)
      end
    end
  end
end
