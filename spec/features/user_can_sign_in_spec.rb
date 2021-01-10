require 'rails_helper'

describe 'signing in' do
  let(:email) { 'testenv@example.com' }
  let(:password) { 'testpass' }
  let!(:user) { User.create(email: email, password: password) }

  it 'user signs in with valid email and password and sees their own wall' do
    visit '/'
    click_button 'Log in'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
    expect(page).to have_current_path("/#{user.id}", ignore_query: true)
    expect(page).to have_content 'Signed in successfully.'
  end
end
