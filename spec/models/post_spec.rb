require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { described_class.new }

  it 'is not valid without a message' do
    expect(subject).to_not be_valid
  end

  it 'is not valid without a userid' do
    subject.message = 'Anything'
    subject.wall_id = 1
    expect(subject).to_not be_valid
  end

  it 'is not valid without a wall' do
    subject.message = 'Anything'
    subject.user_id = user.id
    expect(subject).to_not be_valid
  end

  it 'is valid with valid attributes' do
    user = create_user
    subject.message = "Anything"
    subject.user_id = user.id
    subject.wall_id = 1
    expect(subject).to be_valid
  end
end
