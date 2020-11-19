require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be }

  it "checks if username and email are unique" do
    expect(User.unique_email_and_username?("arakno", "arakno@makers.com")).to eq(true)
  end
  it "checks if username is unique" do
    expect(User.unique_username?("arakno")).to eq(true)
  end
  it "checks if email is unique" do
    expect(User.unique_email?("arakno@makers.com")).to eq(true)
  end
  it "checks if email is valid - passed valid email" do
    expect(User.valid_email?("arakno@makers.com")).to eq(true)
  end
  it "checks if email is valid - passed invalid email" do
    expect(User.valid_email?("araknomakers.com")).to eq(false)
  end
  it "checks password length is between 6 and 10" do 
    expect(User.valid_password?("makers")).to eq(true)
  end
  it "checks password length is between 6 and 10" do 
    expect(User.valid_password?("makers10101")).to eq(false)
  end
end
