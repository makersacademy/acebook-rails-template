require 'rails_helper'

feature "Signing up" do
  scenario "user visits sign up page" do
    visit new_user_registration_path
    expect(page).to have_content('Sign up')

  end

end
