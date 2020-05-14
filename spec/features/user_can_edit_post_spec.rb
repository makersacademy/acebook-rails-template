require 'rails_helper'

RSpec.feature "Edit Post", type: :feature do
  scenario "user can edit existing post" do
    User.create(name: "Gina", password: "123456", email: "gina@example.com")
    log_in_gina
    send_post_hello
    click_on "Edit post"
    fill_in "post[message]", with: "I'm a new message"
    click_button "Update Post"
    expect(page).to have_content("I'm a new message")
    expect(page).not_to have_content("Hello")
  end
end
