require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "User can sign up" do
    visit "/users/new"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Submit"
    expect(page).to have_content("Sign Up successful!")
  end
  scenario "User sees their flash message disappear" do
    visit "/users/new"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Submit"
    expect(page).to have_content("Sign Up successful!")
    visit "/posts/yours"
    expect(page).not_to have_content("Sign Up successful!")
  end

  scenario "User can not leave email field empty" do
    visit "/users/new"
    fill_in "Password", with: "password"
    click_button "Submit"
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email can\'t be blank')
  end

  scenario 'Returns error message if password too long' do
    visit '/users/new'
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "passwordpassword"
    click_button "Submit"
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password is too long')
  end

  scenario 'Returns error message if password too short' do
    visit '/users/new'
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "pass"
    click_button "Submit"
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password is too short')
  end
end
