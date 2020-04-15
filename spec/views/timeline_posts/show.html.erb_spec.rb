require 'rails_helper'

RSpec.describe "timeline_posts/show", type: :view do
  before(:each) do
    @timeline_post = assign(:timeline_post, TimelinePost.create!(
      :content => "MyText",
      :poster => 2,
      :posted => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
