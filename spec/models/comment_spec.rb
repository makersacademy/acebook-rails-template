require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do 
    @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
    @user.save
    @post = @user.posts.build(message: "Hello world")
    @comment = @post.comments.build(user_id: @user.id, comment: "Hemlo")
  end

  describe 'comment should be present' do
    before { @comment.comment = "      " }
      it { is_expected.not_to be_valid }
    end
end
