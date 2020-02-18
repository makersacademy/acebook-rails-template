# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'github authentication' do
    auth = { 'provider' => 'github', 'uid' => '999', 'info' => { 'email' => 'email@example.com', 'nickname' => 'uvalente' } }
    user = User.create_with_omniauth(auth)
    expect(user.provider).to eq 'github'
    expect(user.uid).to eq '999'
    expect(user.email).to eq 'email@example.com'
    expect(user.username).to eq 'uvalente'
  end
end
