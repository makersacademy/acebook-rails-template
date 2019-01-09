require 'rails_helper'

RSpec.describe "avatars/index", type: :view do
  before(:each) do
    assign(:avatars, [
      Avatar.create!(
        :username => "Username",
        :image => "Image"
      ),
      Avatar.create!(
        :username => "Username",
        :image => "Image"
      )
    ])
  end

  it "renders a list of avatars" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
