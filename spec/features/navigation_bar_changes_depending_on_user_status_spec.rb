# frozen_string_literal: true

RSpec.feature 'Nav bar', type: :feature do
  scenario "User's nav bar does not show sign in/up if signed in" do
    sign_up(email: 'test@email.com', password: 'testpass')
    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end

  scenario "User's nav bar does not show sign out if not signed in" do
    visit('/')
    expect(page).not_to have_link('Sign out')
  end
end