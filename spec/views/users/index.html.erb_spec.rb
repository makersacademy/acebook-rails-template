require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "namesixchar",
        :email => "email@name.com",
        :password_digest => "Password Digest"
      ),
      User.create!(
        :name => "namesixchar",
        :email => "email@name.com",
        :password_digest => "Password Digest"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "namesixchar".to_s, :count => 2
    assert_select "tr>td", :text => "email@name.com".to_s, :count => 2
  end
end
