require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @post = Post.new(message: "This is the first message")
  end

  let(:post) { @post }

  it 'should be valid' do
    expect(post).to be_valid
  end

  it 'should contain text' do
    @post.message = ""
    expect(post).not_to be_valid
  end
end
