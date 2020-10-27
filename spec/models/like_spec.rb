# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
    @new_post = FactoryBot.create(:post, :new)
  end

  it 'is valid with valid attributes' do
    like = Like.new(post_id: @new_post.id, user_id: @user.id)
    expect(like).to be_valid
  end

  it 'is not valid without a user id' do
    like = Like.new(post_id: @new_post.id)
    expect(like).to_not be_valid
  end

  it 'is not valid without a post id' do
    like = Like.new(user_id: @user.id)
    expect(like).to_not be_valid
  end
end
