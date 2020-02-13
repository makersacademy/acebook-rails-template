require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new())
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", '/signup', "post" do
    end
  end
end
