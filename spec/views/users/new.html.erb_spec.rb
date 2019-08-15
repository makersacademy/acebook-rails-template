require 'rails_helper'

<<<<<<< HEAD
RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :name => "MyString",
      :email => "MyString",
      :username => "MyString",
      :password => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[username]"

      assert_select "input[name=?]", "user[password]"
    end
  end

=======
RSpec.describe "users/new.html.erb", type: :view do
  pending "add some examples to (or delete) #{__FILE__}"
>>>>>>> master
end
