require 'rails_helper'

RSpec.describe "timeline_posts/new", type: :view do
  before(:each) do
    assign(:timeline_post, TimelinePost.new(
      :content => "MyText",
      :poster => 1,
      :posted => 1
    ))
  end

  it "renders new timeline_post form" do
    render

    assert_select "form[action=?][method=?]", timeline_posts_path, "post" do

      assert_select "textarea[name=?]", "timeline_post[content]"

      assert_select "input[name=?]", "timeline_post[poster]"

      assert_select "input[name=?]", "timeline_post[posted]"
    end
  end
end
