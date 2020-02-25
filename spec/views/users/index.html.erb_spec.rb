require 'rails_helper'


RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "James",
        :email => "email@email.com",
        :username => "James123",
        :password => "Password"
      ),
      User.create!(
        :name => "Bob",
        :email => "email2@email.com",
        :username => "Bob123",
        :password => "Password"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "James", :count => 1
    assert_select "tr>td", :text => "Bob", :count => 1
    assert_select "tr>td", :text => "James123", :count => 1
    assert_select "tr>td", :text => "Bob123", :count => 1
  end

end
