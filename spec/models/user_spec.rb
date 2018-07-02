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
end
