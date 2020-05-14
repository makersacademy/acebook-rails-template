require 'rails_helper'


RSpec.feature "See my posts on wall", type: :feature do
  scenario "Can submit posts and view them" do
    User.create(name: "Gina", password: "123456", email: "gina@example.com")
    log_in_gina
    send_post_hello
    expect(page).to have_content("Hello")
  end

  scenario "Can only see my posts on my wall" do
    User.create(name: "Gina", password: "123456", email: "gina@example.com")
    User.create(name: "Alex", password: "abcdef", email: "alex@example.com")
    log_in_gina
    send_post_hello
    expect(page).to have_content("Hello")
    click_link "Log out"
    #adding second user alex in
    fill_in "session[name]", with: 'Alex'
    fill_in "session[password]", with: "abcdef"
    click_on "Log in"
    click_link "New post"
    fill_in "Message", with: "Hi I'm Alex"
    click_button "Submit"
    expect(page).not_to have_content("Hello")
  end
end


