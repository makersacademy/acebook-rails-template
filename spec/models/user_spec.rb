require 'rails_helper'

RSpec.describe User, type: :model do

  before do 
    @user = User.new(name: "Example Guy", email: "test@example.com", password: "securE123")
  end
  subject { @user } #i.e. subject of test example
  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = ""}
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = ""}
    it { should_not be_valid }
  end

  describe "when email is in an invalid format" do
    before { @user.email = "fakeemail"}
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user.password = "12345"}
    it { should_not be_valid }
  end

  describe "when password is too long" do
    before { @user.password = "1234567Ten11"}
    it { should_not be_valid }
  end

end
