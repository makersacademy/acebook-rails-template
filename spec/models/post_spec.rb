# frozen_string_literal: true

require 'rails_helper'

describe 'Post' do
  it 'has a message' do
    post = Post.new(message: 'Test message 1')
    expect(post.message).to eq 'Test message 1'
  end
end
