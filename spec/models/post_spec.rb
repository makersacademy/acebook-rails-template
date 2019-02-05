require 'rails_helper'

RSpec.describe Post, type: :model do

  # let(:post) { Post.new(message: nil) }
  # let(:user) { User.create( id: 1, email: "bea_courage@hotmail.com", password: "waaa", password_confirmation: 'waaa')}
  # let(:valid_post) { Post.new( message: "valid post", created_at: nil, updated_at: nil, id: user.id )}


  it "post belongs to a user" do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end

  ## only having to test that it has this functionality

  # it "is valid with valid attributes" do 
  #   expect(valid_post).to be_valid
  # end

  # it "is not valid without a message" do
  #   expect(post).to_not be_valid
  # end

  # it "is not valid without a timestamp" do
  #   expect(post).to_not be_valid
  # end

  # it "is not valid without a updated_at" do
  #   expect(post).to_not be_valid
  # end

end
