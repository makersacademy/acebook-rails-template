require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(message: 'Hello, Ruby!', user_id: User.first.id))
  end

  it "renders attributes in <p>" do
    render
  end
end
