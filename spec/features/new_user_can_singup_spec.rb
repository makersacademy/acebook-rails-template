require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario "Can singup and create a new account" do
    sign_up
    expect(page).to have_content("Welcome Zizi!")
  end
end
