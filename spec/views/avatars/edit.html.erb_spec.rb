require 'rails_helper'

RSpec.describe "avatars/edit", type: :view do
  before(:each) do
    @avatar = assign(:avatar, Avatar.create!(
      :username => "MyString",
      :image => "MyString"
    ))
  end

  it "renders the edit avatar form" do
    render

    assert_select "form[action=?][method=?]", avatar_path(@avatar), "post" do

      assert_select "input[name=?]", "avatar[username]"

      assert_select "input[name=?]", "avatar[image]"
    end
  end
end
