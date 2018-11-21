require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user).macro
    expect(association).to eq :belongs_to
  end

  it 'belongs to a post' do
    association = described_class.reflect_on_association(:post).macro
    expect(association).to eq :belongs_to
  end

  it 'is valid when created' do
    comment = build(:comment)
    expect(comment).to be_valid
  end

  it 'is invalid if it does not have a body' do
    expect(Comment.new(user_id: 1, post_id: 1, body: '')).not_to be_valid
  end
end
