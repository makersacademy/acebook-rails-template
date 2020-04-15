require 'rails_helper'

RSpec.describe "profilepictures/index", type: :view do
  before(:each) do
    assign(:profilepictures, [
      Profilepicture.create!(
        :caption => "MyText",
        :user => nil
      ),
      Profilepicture.create!(
        :caption => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of profilepictures" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
