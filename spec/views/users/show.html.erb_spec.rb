require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      email: "Email@test.com",
      password: "Password1"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email@test.com/)
    expect(rendered).to match(//)
  end
end
