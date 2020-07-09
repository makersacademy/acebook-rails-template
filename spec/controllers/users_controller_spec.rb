# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'New User' do
    it 'creates a new user' do
      post :create, params: { user: { name: 'Emanuele', email: 'ema@test.com', password: '12345' } }
      expect(User.find_by(name: 'Emanuele')).to be
      expect(User.find_by(email: 'ema@test.com')).to be
    end
  end

  describe 'invalid username' do
    it 'rejects sign up with no name' do
      user = User.new(name: nil, email: 'ema@test.com', password: '12345')
      expect(user).not_to be_valid
    end
  end

  describe 'invalid email' do
    it 'rejects sign up with no email' do
      user = User.new(name: 'Emanuele', email: nil, password: '12345')
      expect(user).not_to be_valid
    end
  end

  describe 'invalid password' do
    it 'rejects sign up with no password' do
      user = User.new(name: 'Emanuele', email: 'ema@test.com', password: nil)
      expect(user).not_to be_valid
    end
  end
end
