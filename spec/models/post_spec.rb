require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { described_class.new }
  let(:user) { FactoryBot.create(:user) }

  it { should belong_to(:timeline) }
  it { should belong_to(:user) }
  it { should have_many(:likes) }
  it { should have_many(:comments) }

  it "is valid with valid attributes" do
    subject.user_id = user.id
    subject.message = "hello, world"
    expect(subject).to be_valid
  end

  it "is not valid without a name, email and password" do
    expect(subject).to_not be_valid
  end
end
