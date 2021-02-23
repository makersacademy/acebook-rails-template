require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'Can sign up from homepage' do
    visit '/'
    click_button 'Sign up'
    expect(current_path).to eq('/users/sign_up')
    fill_in 'user_email', with: 'anna.cavalla@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully')
    expect(current_path).to eq('/')
  end

  scenario 'Gets redirected to / when not signed in' do
    visit '/posts'
    expect(current_path).to eq('/')

    visit '/foo'
    expect(current_path).to eq('/')
  end
end
