require 'rails_helper'

RSpec.feature "Edit Post", type: :feature do
  scenario "user can edit existing post" do
    User.create(name: "Gina", password: "123456", email: "gina@example.com")
    log_in_gina
    click_on "New post"
    fill_in "Message", with: "Hello World!"
    click_on "Submit"
    click_on "Edit post"
    fill_in "post[message]", with: "I'm a new message"
    click_button "Update Post"
    expect(page).to have_content("I'm a new message")
    expect(page).not_to have_content("Hello World!")
  end

  scenario "Only an author of the post can edit or delete it" do
    @gina = User.create(name: "Gina", password: "123456", email: "gina@example.com")
    @alex = User.create(name: "Alex", password: "abcdef", email: "alex@example.com")
    log_in_gina
    click_on "New post"
    fill_in "Message", with: "Hello World!"
    click_on "Submit"
    click_on "Log out"
    fill_in "session[name]", with: "Alex"
    fill_in "session[password]", with: "abcdef" 
    click_on "Log in"
    visit "/users/#{@gina.id}"
    expect(page).not_to have_button("Edit post")
  end

  scenario "cannot edit post on home page if not the owner" do
    @gina = User.create(name: "Gina", password: "123456", email: "gina@example.com")
    @alex = User.create(name: "Alex", password: "abcdef", email: "alex@example.com")
    log_in_gina
    click_on "New post"
    fill_in "Message", with: "Hello World!"
    click_on "Submit"
    click_on "Log out"
    fill_in "session[name]", with: "Alex"
    fill_in "session[password]", with: "abcdef" 
    click_on "Log in"
    click_on "Home"
    expect(page).not_to have_button("Edit post")
  end
end
