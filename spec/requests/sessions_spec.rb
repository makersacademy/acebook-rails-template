require 'rails_helper'

RSpec.describe "Log in route", type: :request do
  describe "POST /sessions" do

    log_in_test_person = {
      email: "test@testing.com", 
      password: "123456", 
    }

    before do 
      @test_person = FactoryBot.create(:user)
      post '/log_out'
      post '/sessions#new', params: {user: log_in_test_person}
    end

    it "has a status of 200" do
      expect(response).to have_http_status(200)
    end

    it "has a status of logged in" do
      expect(JSON.parse(response.body)['logged_in']).to eq "true"
    end

    it 'returns a user object' do
      expect(JSON.parse(response.body)['user']['email']).to eq "test@testing.com"
      expect(JSON.parse(response.body)['user']['name']).to eq "Test Person"
    end
  end
end