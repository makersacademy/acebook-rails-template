require 'rails_helper'

feature 'sign out' do 
  scenario 'signed in users can sign out' do
    visit('/')
    click_link("Sign In")
    sign_in users(:bob)
    click_link("Sign Out")
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Sign Up")
    expect(page).to_not have_content("Email address")
    expect(page).to_not have_content("Post")
  end
end