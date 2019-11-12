require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #profile" do
    it "expect 302 code as user is not logged in" do
      get(:profile, params: { id: 1 })
      expect(response).to have_http_status(302)
    end
    
  end

end
