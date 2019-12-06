require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up" do
    visit "/"
    click_button "navdropdown"
    click_link "Sign up"
    fill_in "Email", with: "gandolf@middleearth.org"
    fill_in "Password", with: "shadowfax"
    fill_in "Password confirmation", with: "shadowfax"
    fill_in "First name", with: "Gandalf"
    fill_in "Surname", with: "The Grey"
    click_button "Sign up"
    expect(page).to have_content("Posts")
  end
end
