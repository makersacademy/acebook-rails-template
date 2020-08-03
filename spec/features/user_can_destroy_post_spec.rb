require 'rails_helper'

RSpec.feature "Destroy", type: :feature, js: true do
  scenario "Can delete own post" do
    visit "/"
    click_button "Sign Up"
    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "123456"
    click_button "Save User"
    click_button "Login"
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "123456"
    click_button "Login"
    click_link "New post"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Create Post"
    click_link "Back"
    click_link "Destroy"
    page.driver.browser.switch_to.alert.accept
    expect(page).not_to have_content("Hello, world!")
  end
end