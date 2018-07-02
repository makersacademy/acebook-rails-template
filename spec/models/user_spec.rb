require 'rails_helper'

RSpec.describe User, type: :model do
  it 'user input should be valid' do
    user = User.new(name: "Example user", email: "user@email.com")
    expect(user).to be_valid
  end

  it 'name should be present' do
    user = User.new(name: "", email: "user@email.com")
    expect(user).not_to be_valid
  end

  it 'email should be present' do
    user = User.new(name: "Example user", email: "")
    expect(user).not_to be_valid
  end

  it 'name should not be too long' do
    user = User.new(name: "Example user", email: "user@email.com")
    user.name = "a" * 51
    expect(user).not_to be_valid
  end

  it 'email should not be too long' do
    user = User.new(name: "Example user", email: "user@email.com")
    user.email = "user" * 51 + "@email.com"
    expect(user).not_to be_valid
  end

  it 'email validation should accept valid addresses' do
    user = User.new(name: "Example user", email: "user@email.com")
    valid_addresses = %w[hello@email.com GOODBYE@example.com test_1234@mail.com]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid
    end
  end

  it 'email validation should not accept invalid addresses' do
    user = User.new(name: "Example user", email: "user@email.com")
    valid_addresses = %w[helloemail.com GOODBYE&example.com test_1234@mail user@example,com]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).not_to be_valid
    end
  end
end
