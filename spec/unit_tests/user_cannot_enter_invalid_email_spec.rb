require "validates_email_format_of/rspec_matcher"
require 'rails_helper'

describe User do
 it { should validate_email_format_of(:email).with_message('Invalid Email') }
end

describe User do
  it "Should be valid if the password is between 6-10 characters" do
    user = User.new(email: 'test@example.com', password: 'abc1233')
    user.should be_valid
  end

  it "Should not be valid if the password is less than 6 characters" do
    user = User.new(email: 'test@example.com', password: 'abc3')
    user.should_not be_valid
  end

  it "Should not be valid if the password is more than 10 characters" do
    user = User.new(email: 'test@example.com', password: 'abc3234234234')
    user.should_not be_valid
  end


end
