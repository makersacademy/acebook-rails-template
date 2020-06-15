# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomePageController, type: :controller do
  describe 'GET #welcome' do
    it 'returns http success' do
      get :welcome
      expect(response).to have_http_status(:success)
    end
    it 'renders landing page if not signed in' do
      get :welcome
      expect(response).to render_template('landing_page')
    end
  end
  describe 'GET #timeline' do
    it 'returns http success' do
      get :timeline
      expect(response).to have_http_status(200)
    end
  end
end
