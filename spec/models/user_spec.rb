require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validating the user creation process' do
    it 'creates a valid user object' do
      test_user = described_class.new(name: 'Test Name', email: 'testemail@test.com', password: 'password123')

      expect(test_user).to be_valid
      expect(test_user.name).to eq 'Test Name'
      expect(test_user.email).to eq 'testemail@test.com'
    end

    it 'doesnt accept an empty name field' do
      test_user = described_class.new(name: '   ', email: 'testemail@test.com', password: 'password123')
      expect(test_user).not_to be_valid
    end

    it 'doesnt accept an empty email field' do
      test_user = described_class.new(name: 'Test Name', email: '  ', password: 'password123')
      expect(test_user).not_to be_valid
    end

    it 'doesnt accept an empty password field' do
      test_user = described_class.new(name: 'Test Name', email: 'testemail@test.com', password: '   ')
      expect(test_user).not_to be_valid
    end

    it 'doesnt accept a name that is too long' do 
      test_user = described_class.new(name: 'Test Name', email: 'testemail@test.com', password: 'password123')
      test_user.name = 'a' * 51
      expect(test_user).not_to be_valid
    end

    it 'doesnt accept an email that is too long' do 
      test_user = described_class.new(name: 'Test Name', email: 'testemail@test.com', password: 'password123')
      test_user.email = 'a' * 100 + '@test.com' 
      expect(test_user).not_to be_valid
    end



  end

end
