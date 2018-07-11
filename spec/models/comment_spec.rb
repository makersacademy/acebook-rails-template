require 'rails_helper'

RSpec.describe Comment, type: :model do

  it 'raises error when no user_id or post_id' do
    comment = Comment.new

    expect(comment).not_to be_valid
  end

  it 'doesnt raise error when valid user_id and post_id' do

    # post = Post.new
    # comment = Comment.new(content: "Hello" )
    #
    # expect(comment).to be_valid
  end

  # it 'should have a maximum length of 250 chars' do
  #   user = User.new
  #   comment = Comment.new
  # end

end
