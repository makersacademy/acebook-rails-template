require 'rails_helper'

describe 'Signing Up' do
  it 'New user signs up from index page' do
    visit '/'
    click_button 'Sign up'
    expect(page).to have_current_path('/users/sign_up')
  end
  
  scenario "Can sign up with valid details" do
    visit "/users/sign_up"
    fill_in "Email", with: "mob@example.com"
    fill_in "Password", with: "Passwrd1"
    fill_in "Password confirmation", with: "Passwrd1"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  it 'Signing up with a password that is too long' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'mob@example.com'
    fill_in 'Password', with: '12345678910'
    fill_in 'Password confirmation', with: '12345678910'
    click_button 'Sign up'
    expect(page).to have_content('Password is too long (maximum is 10 characters)')
    expect(page).to have_current_path('/users')
  end

  it 'signing up with a password that is too short' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'mob@example.com'
    fill_in 'Password', with: '123'
    fill_in 'Password confirmation', with: '123'
    click_button 'Sign up'
    expect(page).to have_content('Password is too short (minimum is 6 characters)')
    expect(page).to have_current_path('/users')
  end

  it 'signing up with a mismatched password' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'mob@example.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '1234567'
    click_button 'Sign up'
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to have_current_path('/users')
  end

  it 'signing up with an invalid email address' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'mobexample.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    expect(page).to have_content('Email is invalid')
    expect(page).to have_current_path('/users')
  end

  it 'signing up with a duplicate email address can easily log in instead' do
    User.create(email: 'testenv@example.com', password: 'testpass')
    visit '/users/sign_up'
    fill_in 'Email', with: 'testenv@example.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    expect(page).to have_content('This email address has already signed up')
    expect(page).to have_link('Already registered? Log in here', href: '/users/sign_in')
  end
end
