require 'rails_helper'

RSpec.describe "avatars/new", type: :view do
  before(:each) do
    assign(:avatar, Avatar.new(
      :username => "MyString",
      :image => "MyString"
    ))
  end

  it "renders new avatar form" do
    render

    assert_select "form[action=?][method=?]", avatars_path, "post" do

      assert_select "input[name=?]", "avatar[username]"

      assert_select "input[name=?]", "avatar[image]"
    end
  end
end
