require 'rails_helper'

# RSpec.feature "Timeline", type: :feature do
#   scenario "Can submit posts and view them" do
#     visit "/posts"
#     click_link "New post"
#     fill_in "Message", with: "Hello, coppers!\bDid you miss me?"
#     click_button "Submit"
#     # expect(page).to have_content("Hello, world!\bDid you miss me?")
#     expect(page).to have_css('p', text: 'Hello, coppers!')
#     expect(page).to have_css('p', text: 'Did you miss me?')
#     expect(page).to have_content('Posted less than a minute ago')
#   end
# end
private

def sign_up_test
  visit "/users/sign_up"
  email = 'test@test.com'
  fill_in "user_username", with: 'test'
  fill_in "user_email", with: email
  fill_in "user_password", with: 'hello1'
  fill_in "user_password_confirmation", with: 'hello1'
  click_button 'Sign up'
end

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
  sign_up_test
  click_link 'New post'
  expect(page).to have_content("Message")

  fill_in "Message", with: "Hello, coppers!\bDid you miss me?"
  click_button "Submit"
  # expect(page).to have_content("Hello, world!\bDid you miss me?")
  expect(page).to have_css('p', text: 'Hello, coppers!')
  expect(page).to have_css('p', text: 'Did you miss me?')
  # expect(page).to have_content('Posted less than a minute ago')


end

 end
