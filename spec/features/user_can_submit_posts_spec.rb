require 'rails_helper'

RSpec.feature "Timeline" do
  scenario "Can submit posts and view them" do
    user = User.create(id: 1, name: 'matt', email:'mdwareing@gmail.com', password: 'test12345')
    visit '/'
    click_link 'Log In'
    fill_in "Email", with: "mdwareing@gmail.com"
    fill_in "Password", with: "test12345"
    click_button "Log in"
    visit new_user_post_path(user)
    fill_in "Message", with: "Hello, world!\n This is a post with multiple \n lines"
    click_button "Submit"
    expect(page).to have_content("Hello, world!\n This is a post with multiple \n lines")
  end
end
