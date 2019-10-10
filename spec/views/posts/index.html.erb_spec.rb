require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :message => "Message"
      ),
      Post.create!(
        :message => "Message"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Message".to_s, :count => 2
  end
end
