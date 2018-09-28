require 'rails_helper'

RSpec.describe Post, type: :model do

  before do
    @customer = Customer.create(email: 'dave@123.com', password: '123')
    @post = Post.create(message: 'hello world', customer_id: @customer.id)
  end

  it 'Create a new Post object' do
    expect(subject).to be_a Post
  end

  it 'Is linked to user_id' do
    expect(@post.customer_id).to eq @customer.id
  end

end
