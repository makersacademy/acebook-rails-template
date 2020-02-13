# frozen_string_literal: true

feature 'user can sign up' do
  scenario 'checks user can sign up' do
    visit('/')
    click_link('Sign Up')
    fill_in 'user[email]', with: 'userone@gmail.com'
    fill_in 'user[password]', with: 'secret'
    click_button 'Register'
    expect(page).to have_content('Welcome userone@gmail.com')
  end

  scenario 'wrong email address' do
    visit('/')
    click_link('Sign Up')
    fill_in 'user[email]', with: 'usertwo@@gmail.com'
    fill_in 'user[password]', with: 'secret'
    click_button 'Register'
    expect(page).to have_content('error encountered:')
  end

  scenario 'return error if no password is inserted' do
    visit('/')
    click_link('Sign Up')
    fill_in 'user[email]', with: 'userone@gmail.com'
    click_button 'Register'
    expect(page).to have_content('error')
  end

  scenario 'password is too long' do
    visit('/')
    click_link('Sign Up')
    fill_in 'user[email]', with: 'userone@gmail.com'
    fill_in 'user[password]', with: 'passwordistoolong'
    click_button('Register')
    expect(page).to have_content('error')
  end

  scenario 'email is already in use' do
    visit('/')
    click_link('Sign Up')
    fill_in 'user[email]', with: 'userone@gmail.com'
    fill_in 'user[password]', with: 'secret'
    click_button('Register')
    click_link 'Sign Out'
    click_link('Sign Up')
    fill_in 'user[email]', with: 'userone@gmail.com'
    fill_in 'user[password]', with: 'diff'
    click_button('Register')
    expect(page).to have_content('error')
  end
end
