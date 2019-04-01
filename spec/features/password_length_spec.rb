require 'rails_helper'
require 'simple_send_keys'

RSpec.feature "new user password", type: :feature, js: true do
  scenario "user cannot input password more than 10 characters" do
    visit('/')
    click_link('Sign up')
    fill_in('user_email', :with => 'tester@test.com')
    fill_in('user_password', :with => 'reallyreallylongpassword')
    fill_in('user_password_confirmation', :with => 'reallyreallylongpassword')
    click_button 'Sign up'
    expect(page.current_path).to eq '/users'
    expect(page).to have_content("Password is too long (maximum is 10 characters)")
  end

  scenario "user cannot input password less than 6 characters" do
    visit('/')
    click_link('Sign up')
    fill_in('user_email', :with => 'tester@test.com')
    fill_in('user_password', :with => 'short')
    fill_in('user_password_confirmation', :with => 'short')
    click_button 'Sign up'
    expect(page.current_path).to eq '/users'
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end
end

# RSpec.feature "Timeline", type: :feature, js: true do
#   scenario "Can submit posts and view them" do
#     user_sign_up
#     create_new_post("Hello world!")
#     expect(page).to have_content("Hello world!")
#   end
# end
