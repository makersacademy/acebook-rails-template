# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
    @user.save
  end

  describe 'GET /new ' do
    it 'responds with 200 when signed in' do
      sign_in(@user)
      get :new
      expect(response).to have_http_status(200)
    end
    it 'responds with 302 when not signed in' do

      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /' do
    it 'responds with 200 when signed in' do
      sign_in(@user)
      get :index
      expect(response).to have_http_status(200)
    end
    it 'responds with 302 when not signed in' do

      get :new
      expect(response).to have_http_status(302)
    end
  end
end
