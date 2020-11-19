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
end
