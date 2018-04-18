require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "#author" do
    it "returns the username/email" do
      user = User.create(email: "test@test.com", username: "test", password: "password")
      comment = Comment.create(content: "test", post_id: 1, user_id: user.id)
      expect(comment.author).to eq("test")
    end
  end
end
