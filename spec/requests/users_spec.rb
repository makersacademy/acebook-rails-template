require 'rails_helper'

RSpec.describe "create new user route", type: :request do
  describe "POST /users" do

    test_person = {
      name: "Test Person", 
      email: "test1@testing.com", 
      password: "123456", 
      password_confirmation: "123456" 
    }

    before do 
      post '/users', params: {user: test_person}
    end

    it "has a status of 200" do
      expect(response).to have_http_status(200)
    end

    it "has a status of created" do
      expect(JSON.parse(response.body)['status']).to eq "created"
    end

    it 'returns a user object' do
      expect(JSON.parse(response.body)['user']['name']).to eq "Test Person"
    end
  end
end