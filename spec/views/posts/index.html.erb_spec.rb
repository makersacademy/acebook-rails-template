require 'rails_helper'

RSpec.describe "posts", type: :view do
  before(:each) do
    assign(:user, User.new(
      :name => "MyString",
      :email => "MyString1@testing.com",
      :password => "test1234"
    ))
  end

  it "renders time and date posts" do
    render

  #   assert_select "form[action=?][method=?]", users_path, "post" do

  #     assert_select "input[name=?]", "user[name]"

  #     assert_select "input[name=?]", "user[email]"

  #     assert_select "input[name=?]", "user[password]"
  #   end
  # end
end
