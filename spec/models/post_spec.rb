require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { described_class.new }

  it 'is not valid without a message' do
    expect(subject).to_not be_valid
  end

  it 'is not valid without a userid' do
    subject.message = 'Anything'
    expect(subject).to_not be_valid
  end

  it 'is valid with valid attributes' do
    user = create_user
    subject.message = "Anything"
    subject.user_id = user.id
    expect(subject).to be_valid
  end

  it 'only one post is created' do
    user = create_user
    subject.message = "Anything"
    subject.user_id = user.id
    subject.save
    p "-------------------"
    p Post.all
    expect(Post.all.length).to eq(1)
  end

end
