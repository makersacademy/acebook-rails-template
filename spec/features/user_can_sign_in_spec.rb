require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/users/sign_up"
    fill_in :user_first_name, with: "linus"
    fill_in :user_last_name, with: "smit"
    fill_in :user_last_name, with: "smit"
    fill_in :user_email, with: "linus@ollie.com"
    fill_in :user_password, with: "password123"
    fill_in :user_password_confirmation, with: "password123"
    find("input[type=submit][value='Sign up']").click
    User.all.each { |user|
      user.skip_confirmation!
      user.save
    }
    fill_in :user_email, with: "linus@ollie.com"
    fill_in :user_password, with: "password123"
    find("input[type=submit][value='Log in']").click
    expect(page).to have_content("What's on your mind?")
  end
end