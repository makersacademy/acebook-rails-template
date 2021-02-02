require 'rails_helper'

RSpec.describe "Timeline", type: :feature do
  pending "Can submit posts and view them" do
    visit "/users/new"
    fill_in 'user[name]', with: "Tim"
    fill_in "user[email]", with: "tim@tim.com"
    fill_in "user[password]", with: "secret"
    fill_in 'user[password_confirmation]', with: "secret"
    click_button "Create User"
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
