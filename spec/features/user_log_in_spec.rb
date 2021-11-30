require 'rails_helper'
RSpec.feature 'Login', type: :feature do
  scenario "A user can log in" do
    visit '/login'
    click_link 'Log In'
    fill_in 'Email', with: ''
    click_link 'Sign Up'
    expect(page).to have_content'Log In'
  end
end