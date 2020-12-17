require 'rails_helper'

feature 'signing in' do
  scenario 'user signs in with valid email and password' do
    User.create(:email => 'testenv@example.com', :password => 'testpass')
    visit '/'
    click_button 'Log in'
    fill_in 'Email', with: 'testenv@example.com'
    fill_in 'Password', with: 'testpass'
    click_button 'Log in'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Signed in successfully.'
  end
end
