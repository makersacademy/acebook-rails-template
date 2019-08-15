# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  #
  #   it "should get new session" do
  #     get '/login'
  #     assert_response :success
  #   end
  #
end
