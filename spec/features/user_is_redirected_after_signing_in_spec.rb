require 'rails_helper'

RSpec.feature 'Navigated to posts after signing in' do
  scenario 'A signed in user can see posts' do
    visit('/')
    click_link("Register")
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button("Sign up")
    click_link('Sign out')
    click_link 'Sign in'
    fill_in :email, with: "example@example.com"
    fill_in :password, with: "password"
    click_button "Log in"
    expect(page).to have_content "New post"
  end
end
