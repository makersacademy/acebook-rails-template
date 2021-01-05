require 'rails_helper'

RSpec.describe "comment_likes/new", type: :view do
  before(:each) do
    assign(:comment_like, CommentLike.new(
      user: nil,
      commontator_comments: nil
    ))
  end

  it "renders new comment_like form" do
    render

    assert_select "form[action=?][method=?]", comment_likes_path, "post" do

      assert_select "input[name=?]", "comment_like[user_id]"

      assert_select "input[name=?]", "comment_like[commontator_comments_id]"
    end
  end
end
