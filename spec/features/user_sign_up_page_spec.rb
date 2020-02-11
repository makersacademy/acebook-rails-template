require 'rails_helper'

RSpec.feature "SignUpPage", type: :feature do 
  scenario "Can Create an Acebook account on thi spage" do 
    visit "/user/new"
    expect(page).to have_content("Fill in the Below to Create your account")
    expect(page).to have_field('Username')
    expect(page).to have_field('First Name')
    expect(page).to have_field('Last Name')
    expect(page).to have_field('Password')
    expect(page).to have_field('Date of Birth')
    expect(page).to have_selector(:link_or_button, "Create Account!")