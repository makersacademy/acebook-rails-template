require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      p :index
      expect(response).to have_http_status(:redirection)
    end
  end

end
