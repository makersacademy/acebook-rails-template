require 'rails_helper'

feature 'index page for signed in users' do 
  scenario 'signed in users can see posts' do
    visit('/')
    click_link("Sign Up")
    fill_in("user_email", with: "hello@hello.com")
    fill_in("user_password", with: "123456")
    fill_in("user_password_confirmation", with: "123456")
    click_button("Sign up")

    expect(page).to have_content("Posts")
    expect(page).not_to have_content("Welcome to Acebook")
  end
  scenario 'clicking Acebook returns to posts page if signed in' do
    visit('/')
    click_link("Sign Up")
    fill_in("user_email", with: "hello@hello.com")
    fill_in("user_password", with: "123456")
    fill_in("user_password_confirmation", with: "123456")
    click_button("Sign up")
    click_link('Account')
    click_link('Acebook')
    expect(page).to have_content("Posts")
    expect(page).not_to have_content("Welcome to Acebook")
  end
end