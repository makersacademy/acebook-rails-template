require 'rails_helper'

RSpec.feature "Posts have user id", type: :feature do
  scenario "Post has the user id" do
    visit '/'
    fill_in 'user[email_address]', with: 'myemail@gmail.com'
    fill_in 'user[password]', with: 'mypassword'
    click_button 'Sign up'

    visit "/posts"

    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("myemail@gmail.com")
  end
end
