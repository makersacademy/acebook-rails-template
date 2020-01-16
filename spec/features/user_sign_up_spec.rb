require 'rails_helper'
require_relative '../helpers/web_helpers'

RSpec.feature "Sign up", type: :feature do
  scenario "Can create an account" do
    sign_up("David", "Bacall", "dbacall@hotmail.co.uk", "password")
    expect(page).to have_content("Hello David!")
    expect(page).to have_content("David's Wall")
  end

  scenario "Password must be between 6 and 10 characters" do
    sign_up("David", "Bacall", "dbacall@hotmail.co.uk", "passw")
    expect(page).to have_content "Password must be 6-10 characters!"
  end

end
