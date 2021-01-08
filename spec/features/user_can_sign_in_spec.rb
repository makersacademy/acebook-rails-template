require 'rails_helper'

feature 'signing in' do
  scenario 'user signs in with valid email and password' do
    user = User.create(:email => 'testenv@example.com', :password => 'testpass')
    visit '/'
    click_button 'Log in'
    fill_in 'Email', with: 'testenv@example.com'
    fill_in 'Password', with: 'testpass'
    click_button 'Log in'
    expect(current_path).to eq("/#{user.id}")
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario "Signed in user is redirected to posts from home page" do
    User.create(:email => 'testenv@example.com', :password => 'testpass')
    visit '/'
    click_button 'Log in'
    fill_in 'Email', with: 'testenv@example.com'
    fill_in 'Password', with: 'testpass'
    click_button 'Log in'
    visit '/'
    expect(current_path).to eq '/'
    expect(page).not_to have_button("Log in")
    expect(page).not_to have_button("Sign up")
  end
end
