require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete posts" do
    visit "/signup"
    fill_in "Name", with: "Ben"
    fill_in "Email", with: "ben@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Confirm Password", with: "123456"
    click_button "Sign up"
    visit "/login"
    fill_in "Email", with: "ben@gmail.com"
    fill_in "Password", with: "123456"
    click_button "Log in"
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello,\nworld!"
    click_button "Submit"
    expect(page.html).to include("Hello,\r<br>world!")
    click_button "Destroy"
    expect(page.html).to_not include("Hello,\r<br>world!")
  end
end
