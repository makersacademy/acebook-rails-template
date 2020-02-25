# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET / ' do
    it 'responds with 200 when logged in' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

end
