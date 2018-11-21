require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'should have a post id attribute when created' do
    post = create(:post)
    like = create(:like)
    expect(like.post_id).to eq (post.id + 1)
  end

  it 'should have a user id attribute when created' do
    user = create(:user)
    like = create(:like)
    expect(like.user_id).to eq (user.id + 1)
  end

  it 'belongs to a post' do
    association = described_class.reflect_on_association(:post).macro
    expect(association).to eq :belongs_to
  end

  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user).macro
    expect(association).to eq :belongs_to
  end
end
