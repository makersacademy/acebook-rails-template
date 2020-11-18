require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }
end

before :each do
  @post = Post.new(message: "test")
  # let
)
it "time and date objects" do
  expect(@post.simplifydate).to eq("")
  
end
  # render



  # assert_select "form[action=?][method=?]", users_path, "post" do

  #   assert_select "input[name=?]", "user[name]"

  #   assert_select "input[name=?]", "user[email]"

  #   assert_select "input[name=?]", "user[password]"
  # end

