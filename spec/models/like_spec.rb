require 'rails_helper'

RSpec.describe Like, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
    @user.save
    @post = @user.posts.build(message: "Hello world")
    @post.save
    @like = @post.likes.build(user_id: @post.user_id)
  end

  subject { @like }

it { is_expected.to be_valid }

describe "when user_id is not present" do
  before { @like.user_id = nil }
  it { is_expected.not_to be_valid}
end
end
