require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :message => "MyText"
      ),
      Post.create!(
        :message => "MyText"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
