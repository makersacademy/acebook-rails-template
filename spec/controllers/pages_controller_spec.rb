require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #info" do
    it "returns http success" do
      get :info
      expect(response).to have_http_status(:success)
    end
  end

end
