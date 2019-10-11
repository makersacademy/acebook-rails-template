require 'rails_helper'

RSpec.describe "albums/index", type: :view do
  before(:each) do
    assign(:albums, [
      Album.create!(
        :post => "Post",
        :title => "Title",
        :body => "MyText"
      ),
      Album.create!(
        :post => "Post",
        :title => "Title",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of albums" do
    render
    assert_select "tr>td", :text => "Post".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
