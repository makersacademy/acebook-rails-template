require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "DELETE /:id" do
    it "responds with 200" do
      delete :id
      expect(response).to have_http_status(200)
    end
  end
end
