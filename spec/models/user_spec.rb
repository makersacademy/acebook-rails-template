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
end
