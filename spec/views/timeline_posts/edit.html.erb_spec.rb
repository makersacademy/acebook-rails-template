require 'rails_helper'

RSpec.describe "timeline_posts/edit", type: :view do
  before(:each) do
    @timeline_post = assign(:timeline_post, TimelinePost.create!(
      :content => "MyText",
      :poster => 1,
      :posted => 1
    ))
  end

  it "renders the edit timeline_post form" do
    render

    assert_select "form[action=?][method=?]", timeline_post_path(@timeline_post), "post" do

      assert_select "textarea[name=?]", "timeline_post[content]"

      assert_select "input[name=?]", "timeline_post[poster]"

      assert_select "input[name=?]", "timeline_post[posted]"
    end
  end
end
