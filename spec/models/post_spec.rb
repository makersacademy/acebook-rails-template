# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = User.create(username: 'Example User', email: 'user@example.com', password: 'foobar', password_confirmation: 'foobar')
    @post = Post.new(message: 'Lorem ipsum', user_id: @user.id)
    @user
  end

  it 'user id should be present' do
    @post.user_id = nil
    assert !@post.valid?
  end

  it 'content should be present' do
    @post.message = 'new post'
    assert @post.valid?
  end
end
