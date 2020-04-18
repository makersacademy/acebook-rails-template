require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    assign(:user, User.new())
  end

  it "renders the edit user form" do
    render
    assert_select "form[action=?][method=?]", users_path, "post"
  end
end
