require 'rails_helper'

RSpec.feature "You can see post authors", type: :feature do
  #test needs to be modified
  xscenario "Can submit posts and view them" do
    User.create(name: "Gina", password: "123456", email: "gina@example.com")
    visit "/sessions/new"
    fill_in "session[name]", with: "Gina"
    fill_in "session[password]", with: "123456"
    click_on "Log in"
    #visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content "Gina"
  end
end