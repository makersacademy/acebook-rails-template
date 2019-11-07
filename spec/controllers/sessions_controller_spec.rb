require 'rails_helper'

# TEST FAILING - NEEDS TO BE COMPLETED

RSpec.describe Users::SessionsController, type: :controller do
  describe 'POST #create' do
    pending
    it 'welcomes user back with username' do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      post :create, params: { username: "Tan", email: "tan@test.com" }
      # p user.username
      # expect(subject.welcome_message).to eq "Welcome back Tan"
      # p response.welcome_message
      p @params
    end
  end
end
