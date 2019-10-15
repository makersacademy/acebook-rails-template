require 'rails_helper'

RSpec.describe "profile_pictures/new", type: :view do
  before(:each) do
    assign(:profile_picture, ProfilePicture.new())
  end

  it "renders new profile_picture form" do
    render

    assert_select "form[action=?][method=?]", profile_pictures_path, "post" do
    end
  end
end
