require 'rails_helper'

RSpec.describe "timeline_posts/index", type: :view do
  before(:each) do
    assign(:timeline_posts, [
      TimelinePost.create!(
        :content => "MyText",
        :poster => 2,
        :posted => 3
      ),
      TimelinePost.create!(
        :content => "MyText",
        :poster => 2,
        :posted => 3
      )
    ])
  end

  it "renders a list of timeline_posts" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
