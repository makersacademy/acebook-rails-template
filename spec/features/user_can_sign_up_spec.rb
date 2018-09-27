require 'rails_helper'

feature 'User can sign up' do
  scenario 'blank email gives an error' do
    # visit 'users/new'
    visit 'users/sign_up'
    # save_and_open_page

    click_button 'Sign up'
    fill_in 'email', with: ''
    fill_in 'user_password', with: 'test'
    click_on 'Sign up'
    expect(page).to have_content('Email can\'t be blank')
  end

  scenario 'blank password gives an error' do
    visit 'users/sign_up'
    save_and_open_page
    fill_in 'email', with: 'test@test.com'
    click_on 'Sign up'
    expect(page).to have_content('Password can\'t be blank')
  end
end
