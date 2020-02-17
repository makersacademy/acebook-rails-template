require 'rails_helper'

feature 'test sign up' do
  scenario 'Can Sign up and see posts page with Hello on it' do
    visit '/'
    click_button 'Sign Up'
    fill_in 'Email', with: 'ben@gmail.com'
    fill_in 'Password', with: 'Password'
    click_button 'create'
    expect(page).to have_content('Hello')
  end
end
