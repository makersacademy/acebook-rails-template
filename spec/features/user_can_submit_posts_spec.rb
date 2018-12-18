require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User can log in and can submit posts and view them" do
    visit "/"
    click_link "Signup"
    fill_in "user_first_name", with: 'first name'
    fill_in "user_last_name", with: 'last name'
    fill_in "user_email", with: 'test@email.com'
    fill_in "user_password", with: 'password'
    fill_in "user_password_confirmation", with: 'password'
    click_button "Sign up"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("first name")
  end

  scenario "User unable to post and unless signed in" do
    visit "/posts"
    expect(page).not_to have_content("New Post")
  end

  scenario "User tries to hack into new post and gets redirected to login" do
    visit "/posts/new"
    expect(current_path).to eq "/login"
  end
end
