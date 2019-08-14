# require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario "Can singup and create a new account" do
    sign_up
    expect(page).to have_content("Welcome")
  end

  scenario "Can't sign up when pw less than 6 chars" do
    visit "users/sign_up"
    fill_in "user[email]", with: "zizidwengy@email.com"
    fill_in "user[password]", with: "harry"
    fill_in "user[password_confirmation]", with: "harry"
    click_button "Sign up"
    expect(page).to have_content("Complexity requirement not met. Length should be 6-10 characters")
  end

  scenario "Can't sign up when pw less than 6 chars" do
    visit "users/sign_up"
    fill_in "user[email]", with: "zizidwengy@email.com"
    fill_in "user[password]", with: "harryistheworstperson"
    fill_in "user[password_confirmation]", with: "harryistheworstperson"
    click_button "Sign up"
    expect(page).to have_content("Complexity requirement not met. Length should be 6-10 characters")
  end

  scenario "Can't sign up when pw more than 10 chars" do
    visit "users/sign_up"
    fill_in "user[email]", with: "zizidwengy@email.com"
    fill_in "user[password]", with: "harryistheworstperson"
    fill_in "user[password_confirmation]", with: "harryistheworstperson"
    click_button "Sign up"
    expect(page).to have_content("Complexity requirement not met. Length should be 6-10 characters")
  end

  scenario "Can't sign up when pws don't match" do
    visit "users/sign_up"
    fill_in "user[email]", with: "zizidwengy@email.com"
    fill_in "user[password]", with: "harris"
    fill_in "user[password_confirmation]", with: "harrwas"
    click_button "Sign up"
    expect(page).to have_content("Password confirmation doesn't match")
  end

  scenario "Can't sign up when emails invalid" do
    visit "users/sign_up"
    fill_in "user[email]", with: "zizidwengy"
    fill_in "user[password]", with: "harryis"
    fill_in "user[password_confirmation]", with: "harryis"
    click_button "Sign up"
    expect(page).to have_content("Email is invalid")
  end
end
