require 'rails_helper'
require 'feature_test_helper'

RSpec.feature "Login", type: :feature do
  let(:first_name) { 'Bob' }
  let(:last_name) { 'Geldof' }
  let(:email) { 'its.me@bobgeldof.com' }
  let(:password) { 'bob123' }

  scenario "User can view login page" do
    visit "/login"
    expect(page).to have_selector("input[type=submit][value='Log in']")
  end

  scenario "User can login" do
    sign_up
    expect(page).to have_selector("input[type=submit][value='Log in']")
    fill_in('session[email]', with: email)
    fill_in('session[password]', with: password)
    click_button('Log in')
    expect(page).to have_content 'New post'
  end

  scenario "login with invlaid information" do
    sign_up
    expect(page).to have_selector("input[type=submit][value='Log in']")
    fill_in('session[email]', with: email)
    fill_in('session[password]', with: 'password')
    click_button('Log in')
    expect(page).to have_content 'Invalid credentials'
  end
end
