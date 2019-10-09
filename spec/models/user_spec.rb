require 'rails_helper'

RSpec.describe User, type: :model do
  it {is_expected.to be}

  it 'is valid with all atributes' do
    user = User.new(first_name: "Harry", last_name: "Potter", email: "harrypotter@fake.com", password: "111111", password_confirmation: "111111")
    expect(user).to be_valid
  end

  it 'is not valid without a first name' do
    user = User.new(first_name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a valid email' do
    user = User.new(first_name: "Harry", last_name: "Potter", email: "harrypotter", password: "111111", password_confirmation: "111111")
    expect(user).to_not be_valid
  end
end
