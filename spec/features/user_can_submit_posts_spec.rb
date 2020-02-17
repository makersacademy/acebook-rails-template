require 'rails_helper'

feature "test new post" do
 scenario "Can submit posts and view them" do
    visit '/'
    click_button "Sign Up"
    fill_in "Email", with: "ben@gmail.com"
    fill_in "Password", with: "Password"
    click_button "create"

    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

end
