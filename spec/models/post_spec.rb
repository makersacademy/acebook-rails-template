require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }
end

describe 'Creating a post' do
  it 'is owned by a user' do
    user = create_test_user
    post = Post.new
    post.message = 'Like a cheap suit'
    post.user_id = user.id
    post.save!

    expect(post.user).to eq user
  end
end
