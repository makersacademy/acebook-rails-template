require 'rails_helper'

feature 'sign in' do
  scenario 'users get to a sign in page' do
    visit('/')
    click_link("Sign In")
    expect(page).to have_content("Email address")
    expect(page).to have_content("Remember me")
  end
end