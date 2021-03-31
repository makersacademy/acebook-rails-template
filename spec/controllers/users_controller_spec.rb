require 'rails_helper'

RSpec.describe UsersController, type: :controller do
# frozen_string_literal: true

before do
    @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
  end

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end


end