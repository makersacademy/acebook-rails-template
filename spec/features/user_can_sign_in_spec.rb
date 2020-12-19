require 'rails_helper'
require 'helpers/user_helper'

RSpec.feature "User Sign In", type: :feature do
    scenario "User cannot visit pages unless signed in" do
      visit "/posts"
      expect(page).to have_content("You need to sign in or sign up before continuing")
      expect(current_path).to eq "/users/sign_in"
    end
  end

  RSpec.feature "User Sign In", type: :feature do
    scenario "Users are redirected to the sign in page if they are not signed in" do
      visit "/"
      expect(current_path).to eq "/users/sign_in"
    end
  end

RSpec.feature "User Sign In", type: :feature do
  scenario "User cannot sign in without signing up" do
    visit "users/sign_in"
    fill_in "user_email", with: "wendy@wendy.com"
    fill_in "user_password", with: "WendyWendy"
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password.")
  end
end

RSpec.feature "User Sign In", type: :feature do
   scenario "Users are redirected to their posts page when signed in" do
    sign_in
    expect(current_path).to eq "/posts"
  end
end

