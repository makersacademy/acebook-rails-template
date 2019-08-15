require 'rails_helper'

<<<<<<< HEAD

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyString",
      :email => "MyString",
      :username => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[username]"

      assert_select "input[name=?]", "user[password]"
    end
  end

=======
RSpec.describe "users/edit.html.erb", type: :view do
  pending "add some examples to (or delete) #{__FILE__}"
>>>>>>> master
end
