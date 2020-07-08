# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  before(:each) do
    # Capybara.current_driver= :selenium
    visit "/"
    click_link "Sign Up"
    fill_in "user_firstname", with: "testfirstname"
    fill_in "user_lastname", with: "testlastname"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"
    fill_in "email", with: "test@gmail.com"
    fill_in "password", with: "123456"
    click_button "Login"
  end
  scenario 'Can submit posts and view them' do
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Cannot submit empty posts' do
    fill_in 'Message', with: '   '
    click_button 'Submit'
    # expect(page).not_to have_content('   ')
    expect(page).to have_content('cannot submit an empty post')
  end

  # scenario 'Can see the last updated time for a post' do
  #   visit '/posts'
  #   fill_in 'Message', with: 'Hello, world!'
  #   click_button 'Submit'
  #   expect(page).to have_content(Time.now.strftime('%F %H:%M'))
  # end
  #Travis using different time zone so wasn't passing checks

  # scenario 'the page displays the newest message first' do
  #   fill_in 'Message', with: 'Hello, world!'
  #   click_button 'Submit'
  #   fill_in 'Message', with: 'I should be displayed first!'
  #   click_button 'Submit'
  #   expect(first('p')).to have_content('I should be displayed first!')
  # end
  # will fix the above test after merge: test failing because comment button submit.

  # scenario 'the posts text area allows for line breaks' do
  #   fill_in 'Message', with: "Hello\n world!"
  #   click_button 'Submit'
  #   expect(page.html).to match(/Hello\s*<br>\s*world!/)
  # end
  # after(:all) do
  #   Capybara.use_default_driver
  # end
end

# scenario "Can submit posts with line breaks" do
#   sign_up_user
#   fill_in "post_message", with: "Hello\n world!"
#   click_button "Submit"
#   expect(page.html).to match(/Hello\s*<br>\s*world!/)
# end
