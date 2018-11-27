# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :request do
  before :each do
    FactoryBot.create(:user, email: "jeff@hotmail.com", password: "password1")
  end
  before { post "/login", params: { session: { email: 'jeff@hotmail.com', password: 'password1' } } }

  describe 'POST /' do
    it 'responds with 200' do
      expect(json['email']).to eq("jeff@hotmail.com")
    end
  end

  describe 'DELETE /' do
    before { get "/logout" }

    it 'responds with 200' do
      expect(json["message"]).to eq("logged out")
    end

  end

end
