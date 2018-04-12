require 'rails_helper'

RSpec.describe Post, type: :model do
  it "Post Model is valid with valid attributes" do
    expect(Post.new(message: "Hello, world!", user_id: "1")).to be_valid
  end
end
