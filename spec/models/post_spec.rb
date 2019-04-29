require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it "returns true if less than 10 minutes since the post was created" do
    post = Post.create(created_at: Time.now)
    expect(post.less_than_ten_mins_ago).to eq true
  end

  it "returns false if more than 10 minutes since the post was created" do
    post = Post.create(created_at: Time.now)
    Timecop.travel(Time.now + 11.minutes) do
      expect(post.less_than_ten_mins_ago).to eq false
    end
  end
end
