# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create_with_omniauth' do
    let(:auth) do
      {
        'provider' => 'github',
        'info' => {
          'email' => 'jamie.davies@intercom.io',
          'nickname' => 'Jamie Davies'
        }
      }
    end

    let(:auth1) do
      {
        'provider' => 'github',
        'info' => {
          'email' => 'jamie.davies1@intercom.io',
          'nickname' => 'Jamie Daviess'
        }
      }
    end

    it 'creates a user' do
      expect do
        User.create_with_omniauth(auth)
      end.to change {
        User.count
      }.by(1)
    end

    it 'creates a random password' do
      user1 = User.create_with_omniauth(auth)
      user2 = User.create_with_omniauth(auth1)
      expect(user1.password).to_not eql user2.password
    end

    it 'sets the rest of the user properties' do
      user1 = User.create_with_omniauth(auth)
      expect(user1.username).to eq auth['info']['nickname']
      expect(user1.email).to eq auth['info']['email']
    end

    it 'github authentication' do
      auth = { 'provider' => 'github', 'uid' => '999', 'info' => { 'email' => 'email@example.com', 'nickname' => 'uvalente' } }
      user = User.create_with_omniauth(auth)
      expect(user.provider).to eq 'github'
      expect(user.uid).to eq '999'
      expect(user.email).to eq 'email@example.com'
      expect(user.username).to eq 'uvalente'
    end
  end
end
