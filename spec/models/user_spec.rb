require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: "Example user", email: "user@email.com")
  end

  let(:user) {@user}

  it 'user input should be valid' do
    expect(user).to be_valid
  end

  it 'name should be present' do
    user.name = ""
    expect(user).not_to be_valid
  end

  it 'email should be present' do
    user.email = ""
    expect(user).not_to be_valid
  end

  it 'name should not be too long' do
    user.name = "a" * 51
    expect(user).not_to be_valid
  end

  it 'email should not be too long' do
    user.email = "user" * 51 + "@email.com"
    expect(user).not_to be_valid
  end

  it 'email validation should accept valid addresses' do
    valid_addresses = %w[hello@email.com GOODBYE@example.com test_1234@mail.com]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid
    end
  end

  it 'email validation should not accept invalid addresses' do
    valid_addresses = %w[helloemail.com GOODBYE&example.com test_1234@mail user@example,com]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).not_to be_valid
    end
  end

  it 'email addresses should be unique' do
    duplicate_user = user.dup
    user.save
    duplicate_user.email = user.email.upcase
    expect(duplicate_user).not_to be_valid
  end
end
