require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :postBody => "Post Body"
      ),
      Post.create!(
        :postBody => "Post Body"
      )
    ])
  end

  it "renders a list of posts" do
    render
    p response
    assert_select "tr>td", :text => "Post Body".to_s, :count => 2
  end
end
