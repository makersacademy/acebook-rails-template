require 'rails_helper'
require './spec/web_helper/user_sign_up_helper.rb'

RSpec.feature "User sign up", type: :feature do
  scenario "Confirmation for user registration" do
    user_sign_up
    expect(page).to have_content("signed up successfully.")
  end

  scenario "Redirects to post on sign up" do
    user_sign_up
    expect(page).to have_current_path(posts_path)
  end
end
