require 'rails_helper'

RSpec.describe User, type: :model do

  before do 
    @user = User.new(name: "Example Guy", email: "test@example.com")
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

end
