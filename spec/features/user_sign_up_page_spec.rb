require 'rails_helper'

RSpec.feature "SignUpPage", type: :feature do 
  scenario "Can Create an Acebook account on thi spage" do 
    visit "/user/new"
    expect(page).to have_content("Fill in the Below to Create your Account")
    expect(page).to have_content('Username')
    expect(page).to have_content("First name")
    expect(page).to have_content('Last name')
    expect(page).to have_content('Password')
    expect(page).to have_content('Date of birth')
    expect(page).to have_selector(:link_or_button, "Create Account!")
  end
end 