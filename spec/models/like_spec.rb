require 'rails_helper'

RSpec.describe Like, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = User.new(name: "Lizardo", email: "lizardo@example.com", password: "123secure", password_confirmation: "123secure")
    @user.save
    @user2 = User.new(name: "Lizardi", email: "lizardi@example.com", password: "123secure", password_confirmation: "123secure")
    @user2.save
    @post = @user.posts.build(message: "Hello world")
    @post.save
    @post2 = Post.new(user_id: @user.id, message: "hellow world")
    @like = @post.likes.build(user_id: @user.id)
    @like2 = @post.likes.build(user_id: @user2.id)
  end

  subject { @like }

  it { is_expected.to be_valid }

  describe "when user_id is not present" do
    before { @like.user_id = nil }
    it { is_expected.not_to be_valid }
  end

  describe "when user_id is not present" do
    before { @like.post_id = nil }
    it { is_expected.not_to be_valid }
  end

  describe "the likes count should be 2" do
   before do
     @like.save
    end
    it 'should change the count of likes' do
      expect{ @like2.save }.to change { @post.likes.count }.by(1)
    end
  end

end
