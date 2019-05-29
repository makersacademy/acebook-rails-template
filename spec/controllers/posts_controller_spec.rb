# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do


  let (:user) { User.create(name: "test", email: "test@test.com", password: "1234") }

  describe 'GET /new ' do
    it 'responds with 302' do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  # 302 indecates the resource requested has been temp moved - we have
  # redirected them to the login page causing a 302.

  describe 'GET /' do
    it 'responds with 302' do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
