require 'rails_helper'

RSpec.feature "Delete post", type: :feature do 
  scenario "user can delete a post" do
    User.create(name: "Gina", password: "123456", email: "gina@example.com")
    visit "/sessions/new"
    fill_in "session[name]", with: "Gina"
    fill_in "session[password]", with: "123456"
    click_on "Log in"
    click_on "New post"
    fill_in "Message", with: "Hello"
    click_on "Submit"
    click_on "Delete post"
    expect(page).not_to have_content("Hello")
  end
end
