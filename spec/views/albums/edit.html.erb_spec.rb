require 'rails_helper'

RSpec.describe "albums/edit", type: :view do
  before(:each) do
    user = User.create(name: "stephan", dob: '2020-04-04', cob: 'south africa', mob: 112, email: 'stephan@test.com', password: "password")
    @album = assign(:album, Album.create!(
      :caption => "MyText",
      :user => user
    ))
  end

  it "renders the edit album form" do
    render 'form', album: @album

    assert_select "form[action=?][method=?]", album_path(@album), "post" do

      assert_select "textarea", "MyText"
    end
  end
end
