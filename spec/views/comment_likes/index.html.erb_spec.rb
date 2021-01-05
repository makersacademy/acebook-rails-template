require 'rails_helper'

RSpec.describe "comment_likes/index", type: :view do
  before(:each) do
    assign(:comment_likes, [
      CommentLike.create!(
        user: nil,
        commontator_comments: nil
      ),
      CommentLike.create!(
        user: nil,
        commontator_comments: nil
      )
    ])
  end

  it "renders a list of comment_likes" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
