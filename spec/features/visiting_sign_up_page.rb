require 'rails_helper'

RSpec.feature "Viewing Sign Up Page", type: :feature do
  scenario "should have relevant fields" do
    visit('/')
    click_link('Register')
    expect(page).to have_field(:user_name)
    expect(page).to have_field(:user_email)
    expect(page).to have_field(:user_password)
    expect(page).to have_field(:user_password_confirmation)
    expect(page).to have_selector(:button, 'Sign up')
    save_and_open_page
  end
end
