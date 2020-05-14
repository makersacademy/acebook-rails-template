require 'rails_helper'

RSpec.feature "You can see post authors", type: :feature do
  #test needs to be modified
  scenario "Can submit posts and view them" do
    User.create(name: "Gina", password: "123456", email: "gina@example.com")
    log_in_gina
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content "Welcome to your wall, Gina"
  end
end
