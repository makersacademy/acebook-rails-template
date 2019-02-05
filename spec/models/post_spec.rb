require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(email: 'dummy@gmail.com', encrypted_password: 'booooooo', id: 1 )}
  let(:post) { Post.new(message: nil, created_at: nil, updated_at: nil, user_id: 1) }
  let(:valid_post) { Post.new( message: "valid post")}


  it "is valid with valid attributes" do
    p user
    p valid_post

    expect(valid_post).to be_valid
  end 

  it "is not valid without a message" do
    expect(post).to_not be_valid
  end

  it "is not valid without a timestamp" do 
    expect(post).to_not be_valid
  end

  it "is not valid without a updated_at" do 
    expect(post).to_not be_valid
  end
  
end
