require 'rails_helper'

RSpec.describe User, type: :model do

  subject { described_class.new }

  it { should have_many(:posts) }
  it { should have_many(:likes) }
  it { should have_many(:comments) }
  it { should have_one(:timeline) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  it "is valid with valid attributes" do
    subject.id = 1
    subject.first_name = "Anything"
    subject.last_name = "Anything"
    subject.email = "anyEmail@anyDomain.com"
    subject.password = "Any password"
    subject.created_at = Time.now
    subject.updated_at = Time.now
    expect(subject).to be_valid
  end

  it "is not valid without a name, email and password" do
    expect(subject).to_not be_valid
  end
end
