require 'rails_helper'

feature "test index" do
 scenario "Can submit posts and view them" do
    visit '/'
    click_button "Sign Up"
    fill_in "Email", with: "ben@gmail.com"
    fill_in "Password", with: "Password"
    click_button "create"
    expect(page).to have_content("Hello")
  end
end
