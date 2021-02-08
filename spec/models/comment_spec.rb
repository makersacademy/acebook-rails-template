require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "create comment" do
    it "is not valid without valid post" do
      new_comment = Comment.new
      new_comment.user_id = 1
      new_comment.content = "Hello World!"
      expect(new_comment).not_to be_valid
    end

    it "is not valid without valid user" do
      new_comment = Comment.new
      new_comment.post_id = 1
      new_comment.content = "Hello World!"
      expect(new_comment).not_to be_valid
    end

    it "is not valid without content" do
      new_comment = Comment.new
      new_comment.post_id = 1
      new_comment.user_id = 1
      expect(new_comment).not_to be_valid
    end

    it "is valid with content, post_id and user_id" do
      new_comment = Comment.new
      new_comment.post_id = 1
      new_comment.user_id = 1
      new_comment.content = "This is the body of the comment"
      expect(new_comment).to be_valid
    end
  end
end