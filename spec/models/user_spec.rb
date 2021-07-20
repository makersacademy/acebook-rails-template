require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a valid user object' do
    test_user = described_class.new(name: 'Test Name', email: 'testemail@test.com', password: 'password123')

    expect(test_user).to be_valid
    expect(test_user.name).to eq 'Test Name'
    expect(test_user.email).to eq 'testemail@test.com'
  end
end
