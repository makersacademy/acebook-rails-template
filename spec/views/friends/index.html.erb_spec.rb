require 'rails_helper'

RSpec.describe "friends/index", type: :view do
  before(:each) do
    assign(:friends, [
      Friend.create!(
        :confirmed_status => false
      ),
      Friend.create!(
        :confirmed_status => false
      )
    ])
  end

  it "renders a list of friends" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
