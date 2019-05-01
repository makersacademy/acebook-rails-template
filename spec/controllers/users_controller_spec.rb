# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST /' do
    it 'redirects' do
      post :create, params: { user: { email: 'beefboi@beefy.com', password: 'BEEF' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a user' do
      post :create, params: { user: { email: 'beefy@iamalegend.com', password: 'suckurnan' } }
      expect(User.find_by(email: 'beefy@iamalegend.com')).to be
    end

    it 'prevents data entry when invalid email entered' do
      post :create, params: { user: { email: 'beefy', password: 'suckurnan' } }
      expect(User.find_by(email: 'beefy')).to eq(nil)
    end

    it 'displays back-error message when invalid email format given' do
      post :create, params: { user: { email: 'withoutatsymbol', password: 'irrelevant' } }
      expect(flash[:bad_email]).to have_content('This email address is invalid')
    end

    it 'prevents duplicate emails being created in database on sign up' do
      post :create, params: { user: { email: 'testing@duplication.com', password: 'irrelevant' } }
      post :create, params: { user: { email: 'testing@duplication.com', password: 'irrelevant' } }
      expect(User.count).to eq(1)
    end

  end
end
