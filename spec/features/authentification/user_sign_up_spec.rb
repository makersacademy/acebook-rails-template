require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can create an account" do
    sign_up("David", "Bacall", "dbacall@hotmail.co.uk", "password")
    expect(page).to have_content("Hello David!")
    expect(page).to have_content("Feed")
  end

  scenario "Password must be between 6 and 10 characters" do
    sign_up("David", "Bacall", "dbacall@hotmail.co.uk", "passw")
    expect(page).to have_content "Password must be 6-10 characters!"
  end

  scenario "No name sends you back to sign up page" do
    sign_up("", "Bacall", "dbacallhotmail.co.uk", "password")
    expect(page.current_path).to eq '/users'
  end
end
