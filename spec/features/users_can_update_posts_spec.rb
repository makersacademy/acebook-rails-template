require 'rails_helper'

RSpec.feature 'User can update their posts' do
  scenario 'when a user would like to ammend a post' do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link 'Edit post'
    fill_in 'message', with: 'Helllooooo world!'
    click_link 'Update'
    expect(page).to have_content 'Helllooooo world!'
    expect(page).not_to have_content "Hello, world!"
  end
end 
