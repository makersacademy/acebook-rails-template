require 'rails_helper'

RSpec.feature 'Log in' do
  scenario 'user signs in' do
    user = User.new
    user.email = 'test@example.com'
    user.password = 'password'
    user.password_confirmation = 'password'
    user.save!
    visit '/users/sign_in'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    expect(page).to have_content 'Logged in as test@example.com'
  end
end
