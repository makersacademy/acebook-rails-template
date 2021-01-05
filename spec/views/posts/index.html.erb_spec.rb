require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :postBody => "Post Body",
        :user_id => 1
      ),
      Post.create!(
        :postBody => "Post Body",
        :user_id => 1
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "p#look-here", 2
  end
end
