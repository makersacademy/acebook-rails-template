require 'rails_helper'

<<<<<<< HEAD

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :email => "Email",
        :username => "Username",
        :password => "Password"
      ),
      User.create!(
        :name => "Name",
        :email => "Email",
        :username => "Username",
        :password => "Password"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end

=======
RSpec.describe "users/index.html.erb", type: :view do
  pending "add some examples to (or delete) #{__FILE__}"
>>>>>>> master
end
