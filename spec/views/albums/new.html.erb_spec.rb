require 'rails_helper'

RSpec.describe "albums/new", type: :view do
  before(:each) do
    assign(:album, Album.new(
      :post => "MyString",
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new album form" do
    render

    assert_select "form[action=?][method=?]", albums_path, "post" do

      assert_select "input[name=?]", "album[post]"

      assert_select "input[name=?]", "album[title]"

      assert_select "textarea[name=?]", "album[body]"
    end
  end
end
