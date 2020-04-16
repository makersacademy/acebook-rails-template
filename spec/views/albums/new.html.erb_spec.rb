require 'rails_helper'

RSpec.describe "albums/new", type: :view do
  before(:each) do
    user = User.create(name: "stephan", dob: '2020-04-04', cob: 'south africa', mob: 112, email: 'stephan@test.com', password: "password")
    assign(:album, Album.new(
      :caption => "MyText",
      :user => user
    ))
  end

  it "renders new album form" do
    render

    assert_select "form[action=?][method=?]", albums_path, "post" do

      assert_select "textarea", "MyText"

    end
  end
end
