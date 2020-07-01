require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user sign up' do
    it 'allows a new user to sign up' do
      user = User.new(name: 'Emanuele', email: 'ema@test.com', password_digest: 'test')
      expect(user).to be_valid
    end
  end

  describe 'invalid username' do
    it 'rejects sign up with no name' do
      user = User.new(name: nil, email: 'ema@test.com', password_digest: 'test')
      expect(user).to_not be_valid
    end
  end

  describe 'invalid email' do
    it 'rejects sign up with no email' do
      user = User.new(name: 'Emanuele', email: nil, password_digest: nil)
      expect(user).to_not be_valid
    end
  end

  describe 'invalid email' do
    it 'rejects sign up with no password' do
      user = User.new(name: 'Emanuele', email: 'ema@test.com', password_digest: nil)
      expect(user).to_not be_valid
    end
  end
end
