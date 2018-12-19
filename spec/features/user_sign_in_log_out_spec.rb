require 'rails_helper'

RSpec.feature "User interactions", type: :feature do
  scenario "User can sign up" do
    visit_signup_page
    fill_in_signup_form_and_submit
    expect(page).to have_content("first name")
  end

  scenario "User can Log Out" do
    visit_signup_page
    fill_in_signup_form_and_submit
    find(:linkhref, "/users/sign_out").click
    expect(page).not_to have_content("first name")
  end

  scenario "User can sign up, log out, log in" do
    visit_signup_page
    fill_in_signup_form_and_submit
    expect(page).to have_content("first name")
    expect(current_path).to eq("/posts")
    find(:linkhref, "/users/sign_out").click
    expect(current_path).to eq("/")
    expect(page).not_to have_content("first name")
    first(:linkhref, "/login").click
    fill_in_login_form_and_submit
    expect(current_path).to eq("/posts")
    expect(page).to have_content("first name")
  end
end
