require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :email => "Email1@test.com",
        :password => "test1234"
      ),
      User.create!(
        :name => "Name",
        :email => "Email2@test.com",
        :password => "test1234"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
