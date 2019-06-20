require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    expect(User.new(name: 'Lisa', email: 'lisa@email.com', password: 'password')).to be_valid
  end
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
