require 'rails_helper'

RSpec.feature "Sign up message", type: :feature do

  xscenario "After sign up, user sees message saying sign up complete" do
    visit "/users/new"
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: '123'
    click_button "Sign up"
    expect(page).to have_content("Congratulations, you are signed up!")
  end
  
  xscenario "After sign up and refresh of posts page, no message is displayed" do
    visit "/users/new"
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: '123'
    click_button "Sign up"
    visit '/posts'

    expect(page).to_not have_content("Congratulations, you are signed up!")
  end
end
