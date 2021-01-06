require 'rails_helper'

describe 'signing in' do
  it 'user signs in with valid email and password' do
    User.create(email: 'testenv@example.com', password: 'testpass')
    visit '/'
    click_button 'Log in'
    fill_in 'Email', with: 'testenv@example.com'
    fill_in 'Password', with: 'testpass'
    click_button 'Log in'
    expect(page).to have_current_path '/posts'
    expect(page).to have_content 'Signed in successfully.'
  end

  it 'Signed in user is redirected to posts from home page' do
    User.create(email: 'testenv@example.com', password: 'testpass')
    visit '/'
    click_button 'Log in'
    fill_in 'Email', with: 'testenv@example.com'
    fill_in 'Password', with: 'testpass'
    click_button 'Log in'
    visit '/'
    expect(page).to have_current_path '/'
    expect(page).not_to have_button('Log in')
    expect(page).not_to have_button('Sign up')
  end
end
