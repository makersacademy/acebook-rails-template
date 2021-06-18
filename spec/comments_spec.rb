require 'rails_helper'

RSpec.describe Comment, :type => :model do

  it "is not valid without a post" do
    comment = Comment.new
    expect(comment).not_to be_valid
  end

  it "can post a comment" do
    post = Post.create(message: "Test post for comment")
    Comment.create(body: 'This is a other comment', post_id: post.id)

    comment = Comment.where(post_id: post.id)

    connection = PG.connect(dbname: 'pgapp_development')
    connection.query("SELECT * FROM comments WHERE id = '#{post.id}';")
    
    expect(comment.length).to eq(1)
  end

end