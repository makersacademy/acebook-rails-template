require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }
end

describe '#create' do
  it "adds a post to the database" do
    @post = Post.create({ message: 'test'})
    expect(Post.all.include?(@post)).to be(true)
  end

  it "doesn\'t add empty message" do
    @post = Post.create({message: ''})
    expect(Post.all.include?(@post)).to be(false)
  end
end