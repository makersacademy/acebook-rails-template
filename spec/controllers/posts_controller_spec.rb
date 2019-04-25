# frozen_string_literal: true

require 'rails_helper'
require 'feature_test_helpers'

RSpec.describe PostsController, type: :controller do
  describe 'Going to page when not logged in redirects to login' do
    it 'redirects to login page' do
      get :index
      expect(response).to redirect_to("/users/sign_in")
    end
  end
end
