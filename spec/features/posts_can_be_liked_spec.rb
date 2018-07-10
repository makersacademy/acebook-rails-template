require 'rails_helper'

RSpec.feature "Timeline" do
  scenario "Posts can be liked" do
    user = User.create(name: 'matt', email:'mdwareing@gmail.com', password: 'test12345')
    visit "/login"
    fill_in "session_email", with: "mdwareing@gmail.com"
    fill_in "session_password", with: "test12345"
    click_button "Log in"
    visit new_user_post_path(user)
    fill_in "Message", with: "Hello, world!\n This is a post with multiple \n lines"
    click_button "Submit"
    click_link "Like"
    expect(page).to have_content('Likes: 1')
  end
end
