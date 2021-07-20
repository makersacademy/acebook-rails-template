require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validating the user creation process' do
    let(:test_user) { described_class.new(name: 'Test Name', email: 'testemail@test.com', password: 'password123') }

    it 'creates a valid user object' do
      expect(test_user).to be_valid
      expect(test_user.name).to eq 'Test Name'
      expect(test_user.email).to eq 'testemail@test.com'
    end

    it 'doesnt accept an empty name field' do
      test_user.name = '   '
      expect(test_user).not_to be_valid
    end

    it 'doesnt accept an empty email field' do
      test_user.email = '  '
      expect(test_user).not_to be_valid
    end

    it 'doesnt accept an empty password field' do
      test_user.password = '  '
      expect(test_user).not_to be_valid
    end

    it 'doesnt accept a name that is too long' do 
      test_user.name = 'a' * 51
      expect(test_user).not_to be_valid
    end

    it 'doesnt accept an email that is too long' do 
      test_user.email = 'a' * 100 + '@test.com' 
      expect(test_user).not_to be_valid
    end

    it 'should accept valid emails' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
      # ["user@example.com", "USER@foo.COM", "A_US-ER@foo.bar.org", "first.last@foo.jp", "alice+bob@baz.cn"]

      valid_addresses.each do |valid_address|
        test_user.email = valid_address
        expect(test_user).to be_valid
      end
    end

    it 'doesnt accept invalid emails' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]

      invalid_addresses.each do |invalid_address|
        test_user.email = invalid_address
        expect(test_user).not_to be_valid
      end
    end

  end

end
