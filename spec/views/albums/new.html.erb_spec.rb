require 'rails_helper'

RSpec.describe "albums/new", type: :view do
  before(:each) do
    assign(:album, Album.new())
  end

  it "renders new album form" do
    render

    assert_select "form[action=?][method=?]", albums_path, "post" do
    end
  end
end
