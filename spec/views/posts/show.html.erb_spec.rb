require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :postBody => "Post Body"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Post Body/)
  end
end
