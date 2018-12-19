require 'rails_helper'

RSpec.describe "bios/index", type: :view do
  before(:each) do
    assign(:bios, [
      Bio.create!(
        :id => 2,
        :age => 3,
        :bio => "MyText",
        :location => "MyText"
      ),
      Bio.create!(
        :id => 2,
        :age => 3,
        :bio => "MyText",
        :location => "MyText"
      )
    ])
  end

  it "renders a list of bios" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
