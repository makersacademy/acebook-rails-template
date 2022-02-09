require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    Post.delete_all
    @post = Post.create(message: "Hello, there!")
  end

  it 'checks that a post can be created' do
    expect(@post).to be_valid
  end

  it 'checks a post can be read' do
    expect(Post.find_by_message("Hello, there!")).to eq(@post)
  end

  it 'updates a post' do
    @post.update(message: "No way")
    expect(Post.find_by_message("No way")).to eq(@post)
  end

  it 'deletes a post' do
    @post.destroy
    expect(Post.find_by_message("Hello, there!")).to be_nil
  end

  # it { is_expected.to be }
end

