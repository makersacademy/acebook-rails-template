require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do
  describe "GET /users_signups" do
    it "works! (now write some real specs)" do
      get '/users/new'
      expect(response).to have_http_status(200)
    end
    it 'handles an invalid signup' do
      get '/users/new'
      post '/users', params: { user: {
        name: "",
        email: "invalid@email",
        password: "weaker",
        password_confirmation: "weakest"
      }
      }
      expect(response).to render_template(:new)
    end
  end

end
