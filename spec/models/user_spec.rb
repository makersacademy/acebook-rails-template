require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be }

  it "checks if username and email are in use" do
    expect(User.email_and_username_in_use?("arakno", "arakno@makers.com")).to eq(false)
  end
  it "checks if username is in use" do
    expect(User.username_in_use?("arakno")).to eq(false)
  end
  it "checks if email is in use" do
    expect(User.email_in_use?("arakno@makers.com")).to eq(false)
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
