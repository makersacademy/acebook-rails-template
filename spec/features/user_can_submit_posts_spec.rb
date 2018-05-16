require 'rails_helper'
def user_makes_a_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end

def user_signs_up
  visit "/users/sign_up"
  fill_in "user_email", with: "jordan@matt.com"
  fill_in "user_password", with: "123456abc"
  fill_in "user_password_confirmation", with: "123456abc"
  click_button "Sign up"
end

RSpec.feature "Timeline", type: :feature do

  scenario "User email displayed with a post" do
    user_signs_up
    user_makes_a_post
    expect(page).to have_content("Hello, world! jordan@matt.com")
  end

  scenario "Time is displayed with post" do
    user_signs_up
    user_makes_a_post
    expect(page).to have_content("Hello, world! jordan@matt.com less than a minute ago")
  end
end
