require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/users/sign_up"
    fill_in 'user_email', with: "1234@gmail.com"
    fill_in 'user_password', with: "password"
    fill_in 'user_password_confirmation', with: "password"
    find('.actions').find('input').click
    
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
