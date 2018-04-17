require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :post_id => 1,
      :body => "MyText"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input[name=?]", "comment[post_id]"

      assert_select "textarea[name=?]", "comment[body]"
    end
  end
end
