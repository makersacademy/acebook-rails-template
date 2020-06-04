require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it 'User post input not to be nil' do
    post = Post.create(message: 'This is a new message!')
    expect(post).to be_valid
  end

  it 'User post input to be nil' do
    post = Post.create(message: nil)
    expect(post).to_not be_valid
  end

end
