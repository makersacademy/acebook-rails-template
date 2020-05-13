require 'rails_helper'

RSpec.feature "Edit Post", type: :feature do
  xscenario "user can edit existing post" do
    User.create(name: "Gina", password: "123456", email: "gina@example.com")
    post = Post.create!(message: "Hello World!")
    visit "/sessions/new"
    fill_in "session[name]", with: "Gina"
    fill_in "session[password]", with: "123456"
    click_on "Log in"
    click_button "Edit post"
    fill_in "post[message]", with: "I'm a new message"
    click_button "Update Post"
    expect(page).to have_content("I'm a new message")
    expect(page).not_to have_content("Hello World!")
  end
end

