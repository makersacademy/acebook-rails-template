require 'rails_helper'

RSpec.feature 'Posts are ordered', type: :feature do
  scenario 'Posts are ordered by newest first' do
    visit '/'
    fill_in 'user[email_address]', with: 'myemail@gmail.com'
    fill_in 'user[password]', with: 'mypassword'
    click_button 'Sign up'

    click_link "New post"
    fill_in "Message", with: "First post"
    click_button "Submit"

    click_link "New post"
    fill_in "Message", with: "Second post"
    click_button "Submit"
    visit "/posts"

    expect(page.body.index("Second post")).to be < page.body.index("First post")
  end
end
