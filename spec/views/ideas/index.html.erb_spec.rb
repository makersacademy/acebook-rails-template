require 'rails_helper'

RSpec.describe "ideas/index", type: :view do
  before(:each) do
    assign(:ideas, [
      Idea.create!(
        :name => "Name",
        :description => "MyText",
        :picture => "Picture"
      ),
      Idea.create!(
        :name => "Name",
        :description => "MyText",
        :picture => "Picture"
      )
    ])
  end

  it "renders a list of ideas" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
  end
end
