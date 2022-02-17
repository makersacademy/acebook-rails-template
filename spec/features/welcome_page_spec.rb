require 'rails_helper'

feature 'welcome page' do
  scenario 'welcome page, not signed in' do 
    visit('/')
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Sign Up")
    expect(page).to_not have_content("Email address")
    expect(page).to_not have_content("Post")
  end
  scenario 'clicking Acebook returns to welcome page if not signed in' do
    visit('/')
    click_link('Sign Up')
    click_link('Acebook')
    expect(page).to have_content("Welcome to Acebook")
  end
  
end