require 'rails_helper'

RSpec.describe "comment_likes/show", type: :view do
  before(:each) do
    @comment_like = assign(:comment_like, CommentLike.create!(
      user: nil,
      commontator_comments: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
