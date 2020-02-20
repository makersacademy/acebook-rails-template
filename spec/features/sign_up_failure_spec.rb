require 'rails_helper'

RSpec.feature "HomePage", type: :feature do 
  scenario "Can See a sign in and fields for it and sign up link" do 
    visit "/"
    click_on 'Sign Up'
    fill_in "username", with: "BigJD"
    fill_in "email", with: "test2.com"
    fill_in "password", with: "123"
    click_button("Create Account!")
    expect(page).to have_content("Email or Password not valid. Password must be 6-10 characters long.")
  end
end
