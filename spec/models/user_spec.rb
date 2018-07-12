require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: "Example user", email: "user@email.com", password: "Password123", password_confirmation: "Password123")
  end

  let(:user) { @user }

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

  it 'password should be present' do
    user.password = user.password_confirmation = " " * 6
    expect(user).not_to be_valid
  end

  it 'password should have a minimum length' do
    user.password = user.password_confirmation = "a" * 5
    expect(user).not_to be_valid
  end

  context 'users' do
    user1 = User.create(name: 'matt', email:'mdwareing@gmail.com', password: 'test12345')
    user2 = User.create(name: 'ben', email:'ben@gmail.com', password: 'test12345')

    it 'dont follow each other automatically' do
      expect(user1.following?(user2)).to be false
    end

    it 'can follow one another' do
      user1.follow(user2)
      expect(user1.following?(user2)).to be true
    end

    it 'can unfollow one another' do
      user1.unfollow(user2)
      expect(user1.following?(user2)).to be false
    end

    it 'are included in another users followers list' do
      user1.follow(user2)
      expect(user1.following).to include(user2)
    end
  end

end
