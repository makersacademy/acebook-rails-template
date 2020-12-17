require 'rails_helper'
require 'helpers/user_helper'

RSpec.feature "User Sign In", type: :feature do
    scenario "User cannot visit pages unless signed in" do
      visit "/posts"
      expect(page).to have_content("You need to sign in or sign up before continuing")
      expect(current_path).to eq "/users/sign_in"
    end
  end

# When a user hasn't signed in and visits the index of the application:

# if they visit another URL, they are redirected to the index
# they can see a link to a sign in page which prompts them to enter in their email address and password.
# they can only enter valid emails
# When they submit their details, they are logged in and redirected to their posts page.