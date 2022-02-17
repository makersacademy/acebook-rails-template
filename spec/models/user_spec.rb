require 'rails_helper'

RSpec.describe User, type: :model do
  before (:each) do
    User.delete_all

      @user = User.create(
        {:name => "Guy", 
        :email => "guy@gmail.com", 
        :password => "111111"}
      )
  end

  it 'checks that a user can be created' do
    expect(@user).to be_valid
  end

  it 'checks a user has a name' do
    expect(User.find_by_name("Guy")).to eq(@user)
  end

  it 'checks that a user has an email address' do
    expect(User.find_by_name("Guy").email).to be
  end

  it 'checks that a user has a password' do
    expect(User.find_by_name("Guy").encrypted_password).to be
  end

  it 'updates a user' do
    @user.update(name: "Guy Guyson")
    expect(User.find_by_name("Guy Guyson")).to eq(@user)
  end

end
