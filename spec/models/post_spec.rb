require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:post) { @post }

  it 'should be valid' do
    user = User.create(name: "simone", email: "mail@simone.com", password: "123456")
    post = user.posts.create(message: "Thi is the first message")
    expect(post).to be_valid
  end

  it 'should contain text' do
    @post = Post.new(message: "This is the first message")
    @post.message = ""
    expect(post).not_to be_valid
  end
end
