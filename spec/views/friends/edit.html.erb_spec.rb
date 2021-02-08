require 'rails_helper'

RSpec.describe "friends/edit", type: :view do
  before(:each) do
    @friend = assign(:friend, Friend.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :username => "MyString"
    ))
  end

  it "renders the edit friend form" do
    render

    assert_select "form[action=?][method=?]", friend_path(@friend), "post" do

      assert_select "input[name=?]", "friend[first_name]"

      assert_select "input[name=?]", "friend[last_name]"

      assert_select "input[name=?]", "friend[email]"

      assert_select "input[name=?]", "friend[username]"
    end
  end
end
