require 'rails_helper'

RSpec.describe "Log in route", type: :request do
  describe "POST /authenticate" do

    before do 
      test_person = FactoryBot.create(:user)
      token = JsonWebToken.encode(user_id: test_person.id)
      headers = { "Authorization" => token }

      post '/log_out'
      post '/authenticate', params: { 
        user: {
          email: test_person.email, 
          password: test_person.password
          } 
        }, 
        headers: headers
    end

    it "has a status of 200" do
      expect(response).to have_http_status(200)
    end

    it "has a status of logged in" do
      expect(JSON.parse(response.body)['logged_in']).to eq true
    end

    it 'returns a user object' do
      expect(JSON.parse(response.body)['user']['email']).to eq "test@testing.com"
      expect(JSON.parse(response.body)['user']['name']).to eq "Test Person"
    end
  end
end