require 'rails_helper'

RSpec.describe "comment_likes/edit", type: :view do
  before(:each) do
    @comment_like = assign(:comment_like, CommentLike.create!(
      user: nil,
      commontator_comments: nil
    ))
  end

  it "renders the edit comment_like form" do
    render

    assert_select "form[action=?][method=?]", comment_like_path(@comment_like), "post" do

      assert_select "input[name=?]", "comment_like[user_id]"

      assert_select "input[name=?]", "comment_like[commontator_comments_id]"
    end
  end
end
