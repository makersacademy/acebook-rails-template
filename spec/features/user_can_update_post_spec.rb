require "rails_helper"


RSpec.feature "Update post", type: :feature do
  before do
    Timecop.freeze(Time.local(2019, 9, 13, 10, 0, 0))
  end

  scenario "User CANNOT update post after ten minutes of creation" do
    visit "/users/sign_up"
    fill_in "user[email]", with: "test@gmail.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_button "Sign up"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    Timecop.travel(Time.local(2019, 9, 13, 10, 15, 1))
    visit current_path
    expect(page).not_to have_selector(:link_or_button, "Update")
  end

  scenario "User CAN update before ten minutes of creation" do
    visit "/users/sign_up"
    fill_in "user[email]", with: "test@gmail.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_button "Sign up"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_selector(:link_or_button, "Update")
  end
end
