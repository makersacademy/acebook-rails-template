require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    
      user = User.create(
        {:email => "guy@gmail.com", 
        :password => "111111"}
      )
      
    Post.delete_all
    @post = Post.create({ message: "Hello, there!", user_id: user.id} )
  end

  it 'checks that a post can be created' do
    expect(@post).to be_valid
  end

  it 'checks a post can be read' do
    expect(Post.find_by_message("Hello, there!")).to eq(@post)
  end

  it 'checks that a post has a user_id' do
    expect(Post.find_by_message("Hello, there!").user_id).to be
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
