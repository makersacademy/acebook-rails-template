require 'rails_helper'
require 'login_signup_helper'

RSpec.feature "User details display", type: :feature do
<<<<<<< HEAD
<<<<<<< HEAD
    scenario "Can see user name and date information alongside each post" do
      login_percy_onepost
      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_content('Create a post')
=======
    scenario "Can see user name and date information alongside each post" do
      login_percy_onepost
      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_content('Message')
>>>>>>> 0d0de76438bf99e49cabd4fdd518d007f0ca5e04
      fill_in "post_message", with: "test feature message"
      click_on "Submit"
      expect(page).to have_content("test feature message")
      expect(page).to have_content("Percy Onepost")
      expect(page.body).to match(/#{TIMESTAMP_REGEX}/)
    end
<<<<<<< HEAD
=======
  scenario "Can see user name and date information alongside each post" do
    login_percy_onepost
    expect(page).to have_content('Logged in')
    expect(page).to have_content('Message')
    fill_in "post_message", with: "test feature message"
    click_on "Submit"
    expect(page).to have_content("test feature message")
    expect(page).to have_content("Percy Onepost")
    expect(page.body).to match(/#{TIMESTAMP_REGEX}/)
  end
>>>>>>> c92f9f3b6adc236ca4b4961a9301e757b8cf1b47
=======
>>>>>>> 0d0de76438bf99e49cabd4fdd518d007f0ca5e04
end
