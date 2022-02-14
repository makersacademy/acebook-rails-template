require 'rails_helper'

feature 'welcome page' do
  scenario 'welcome page, not signed in' do 
    visit('/')
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Sign Up")
    expect(page).to_not have_content("Email address")
    expect(page).to_not have_content("Post")
  end
end