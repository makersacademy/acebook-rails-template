require 'rails_helper'
require 'web_helpers'

RSpec.feature "User Account Features", type: :feature do
  scenario "Can sign up" do
    sign_up
    expect(page).to have_content("Posts")
  end

  scenario "Can sign in" do
    sign_up
    click_on "navdropdown"
    click_on "Sign out"
    click_on "navdropdown"
    click_on "Sign in"
    fill_in "Email", with: "gandalf@middleearth.org"
    fill_in "Password", with: "shadowfax"
    click_on "Log in"
    expect(page).to have_content("Posts")
  end

  # scenario "if no user if signed in you will always be redirected to home page" do
  #   visit '/posts'
  #   expect(page).to have_button("Sign Up")
  #   visit '/posts/new'
  #   expect(page).to have_button("Sign Up")
  # end




end
