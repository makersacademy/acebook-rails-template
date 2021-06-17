require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.username = "Anything"
    subject.email = "example@gmail.com"
    subject.password = "password123"
    expect(subject).to be_valid
  end
  it "is not valid without a username"

  it "is not valid without a email"
  it "is not valid without a password"
  it "is not valid without a password confirmation"
end