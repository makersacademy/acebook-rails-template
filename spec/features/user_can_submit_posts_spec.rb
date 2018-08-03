require 'rails_helper'
require 'helpers/users_helper_spec'

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
  end
end
