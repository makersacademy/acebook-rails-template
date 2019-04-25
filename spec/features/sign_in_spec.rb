require 'rails_helper'
require 'sign_up_helper'

RSpec.feature "Sign in", type: :feature do
  scenario "User redirected if not signed in & visits posts, then prompted to sign in" do 
    visit '/posts'
    expect(page).to have_content("Log in")
    expect(page).to have_button("Log in")
  end

  scenario "User redirected if not signed in & visits posts" do 
    visit '/posts'
    expect(page).to have_current_path("/users/sign_in")
  end

end