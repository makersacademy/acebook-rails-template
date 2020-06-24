require 'rails_helper'

RSpec.describe "tests/index", type: :view do
  before(:each) do
    assign(:tests, [
      Test.create!(
        :name => "Name",
        :description => ""
      ),
      Test.create!(
        :name => "Name",
        :description => ""
      )
    ])
  end

  it "renders a list of tests" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
