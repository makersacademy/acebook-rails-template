require 'rails_helper'

RSpec.feature 'Posts have creation dates', type: :feature do
  scenario 'Posts have a posted date' do
    visit '/'
    fill_in 'user[email_address]', with: 'myemail@gmail.com'
    fill_in 'user[password]', with: 'mypassword'
    click_button 'Sign up'

    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content(DateTime.now.strftime("%Y-%m-%d"))
  end
end
