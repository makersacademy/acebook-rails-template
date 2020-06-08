require 'rails_helper'

feature 'User can login', type: :feature do
  scenario 'a user can login' do
    # signs the user in
    user = User.create(fname: 'Jon', lname: 'Doe', email: 'john.doe@example.com', password: 'password')

    visit '/sessions/new'

    expect(page).to have_content 'Log in'

    fill_in 'user[email]', with: 'john.doe@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign in'

    expect(current_path).to eq "/posts"
    expect(page).to have_content "Welcome #{user.fname} #{user.lname}"
  end

  context 'when the email is wrong' do
    scenario 'user gets redirected' do
      User.create(fname: 'jon', lname: 'doe', email: 'john.doe@example.com', password: 'password')

      visit '/sessions/new'
      fill_in 'user[email]', with: 'wrong@example.com'
      fill_in 'user[password]', with: 'password'
      click_button 'Sign in'

      expect(current_path).to eq '/sessions/new'
      expect(page).to have_content 'Email and/or password is incorrect'
    end
  end

  context 'when the password is wrong' do
    scenario 'user gets redirected ' do
      User.create(fname: 'jon', lname: 'doe', email: 'john.doe@example.com', password: 'password')

      visit '/sessions/new'
      fill_in 'user[email]', with: 'john.doe@example.com'
      fill_in 'user[password]', with: 'wrongpassword'
      click_button 'Sign in'

      expect(current_path).to eq '/sessions/new'
      expect(page).to have_content 'Email and/or password is incorrect'
    end
  end
end
