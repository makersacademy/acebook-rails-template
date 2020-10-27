# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  it 'is valid with valid attributes' do
    post = Post.new(message: 'Hello, World!', user_id: @user.id)
    expect(post).to be_valid
  end
  it 'is not valid without a message' do
    post = Post.new(message: '', user_id: @user.id)
    expect(post).to_not be_valid
  end
  it 'is not valid without a user ID' do
    post = Post.new(message: 'Hello, World!', user_id: '')
    expect(post).to_not be_valid
  end
end
