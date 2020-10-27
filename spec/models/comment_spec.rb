# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
    @new_post = FactoryBot.create(:post, :new)
  end

  it 'is valid with valid attributes' do
    comment = Comment.new(comment: 'First!!', user_id: @user.id, post_id: @new_post.id)
    expect(comment).to be_valid
  end
  it 'is not valid without a comment' do
    comment = Comment.new(comment: '', user_id: @user.id, post_id: @new_post.id)
    expect(comment).to_not be_valid
  end
  it 'is not valid without a post ID' do
    comment = Comment.new(comment: 'First!!', user_id: @user.id, post_id: '')
    expect(comment).to_not be_valid
  end
  it 'is not valid without a user ID' do
    comment = Comment.new(comment: 'First!!', user_id: '', post_id: @new_post.id)
    expect(comment).to_not be_valid
  end
end
