require 'rails_helper'

RSpec.describe "albums/new", type: :view do
  before(:each) do
    assign(:album, Album.new(
      :caption => "MyText",
      :user => nil
    ))
  end

  it "renders new album form" do
    render

    assert_select "form[action=?][method=?]", albums_path, "post" do

      assert_select "textarea[name=?]", "album[caption]"

      assert_select "input[name=?]", "album[user_id]"
    end
  end
end
