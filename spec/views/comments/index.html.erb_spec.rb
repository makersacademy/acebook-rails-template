require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        comment: "Comment",
        user: nil,
        post: nil
      ),
      Comment.create!(
        comment: "Comment",
        user: nil,
        post: nil
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", text: "Comment".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
