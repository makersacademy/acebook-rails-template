require 'rails_helper'

feature 'test sign in' do
  scenario 'Sign up / logout and then sign in' do
    # First Sign Up so ther user exists in the system
    visit '/'
    click_button 'Sign Up'
    fill_in 'Email', with: 'ben@gmail.com'
    fill_in 'Password', with: 'Password'
    click_button 'create'

    # First Sign Up so ther user exists in the system
    click_link 'logout'

    # then login
    fill_in 'Email', with: 'ben@gmail.com'
    fill_in 'Password', with: 'Password'
    click_button 'Log In'

    expect(page).to have_content('Hello')
  end
end
