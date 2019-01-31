require 'rails_helper'

RSpec.describe Post, type: :model do
  post = Post.create(message: 'Hello world', created_at: '2019-01-31 15:18:43.781661000')

  it 'Post is an instance of the Post class' do
     expect(post).to be_an_instance_of (Post)
   end

  it 'Post is able to store a message' do
    expect(post.message).to eq('Hello world')
  end

  it 'Post is able to record the creation date' do
    expect(post.created_at).to eq('2019-01-31 15:18:43.781661000')
  end

  it 'Post is able to be edited' do
    post.update(message: 'how are you ?')
    expect(post.message).to eq('how are you ?')
  end


end
