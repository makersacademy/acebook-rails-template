require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid when created' do
    expect(User.new(email: 'test@test.com', password: 'password123')).to be_valid
  end

  it 'is not valid without an email' do
    expect(User.new(password: 'password123')).not_to be_valid
  end

  it 'is not valid without a password' do
    expect(User.new(email: 'test@test.com')).not_to be_valid
  end
end
