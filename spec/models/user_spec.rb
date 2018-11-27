require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid when created' do
    user = create(:user)
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    expect(User.new(email: '', password: 'password123')).not_to be_valid
  end

  it 'is not valid without a password' do
    expect(User.new(email: 'alicebobson1@gmail.com', password: '')).not_to be_valid
  end

  it 'has many comments' do
    association = described_class.reflect_on_association(:comments).macro
    expect(association).to eq :has_many
  end

  it 'has many chatrooms' do
    association = described_class.reflect_on_association(:chat_rooms).macro
    expect(association).to eq :has_many
  end

  it 'has many messages' do
    association = described_class.reflect_on_association(:messages).macro
    expect(association).to eq :has_many
  end
end
