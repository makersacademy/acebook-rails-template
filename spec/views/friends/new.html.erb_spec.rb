require 'rails_helper'

RSpec.describe "friends/new", type: :view do
  before(:each) do
    assign(:friend, Friend.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :username => "MyString"
    ))
  end

  it "renders new friend form" do
    render

    assert_select "form[action=?][method=?]", friends_path, "post" do

      assert_select "input[name=?]", "friend[first_name]"

      assert_select "input[name=?]", "friend[last_name]"

      assert_select "input[name=?]", "friend[email]"

      assert_select "input[name=?]", "friend[username]"
    end
  end
end
