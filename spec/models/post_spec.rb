require 'rails_helper'

RSpec.describe Post, type: :model do
  include ActiveSupport::Testing::TimeHelpers
  it { is_expected.to be }
  it "has time and date objects" do
    @post = Post.new(message: "test")
    Time.current 
    travel_to Time.zone.local(2004, 11, 24, 01, 04, 44)
    expect(@post.simplifydate(Time.current)).to eq("24-11-2004")
    expect(@post.simplifytime(Time.current)).to eq("01:04")
  end
end


