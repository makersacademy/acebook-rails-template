require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        email: "Email1",
        password: "password"
      ),
      User.create!(
        email: "Email2",
        password: "password"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "Email1".to_s, count: 1
    assert_select "tr>td", text: "Email2".to_s, count: 1
  end
end
