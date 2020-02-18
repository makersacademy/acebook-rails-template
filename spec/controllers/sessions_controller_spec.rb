# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    describe 'DELETE #destroy,' do
      it 'returns http success' do
        delete :destroy
        expect(response).to have_http_status(302)
        expect(session[:user_id]).to eq(nil)
      end
    end
  end
end
