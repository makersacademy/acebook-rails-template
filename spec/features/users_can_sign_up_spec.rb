require 'rails_helper'

RSpec.feature 'Main page signup', type: :feature do
  # edit the below to reflect correct field names
  # scenario 'Users can sign up' do
  #   visit '/'
  #   fill_in 'Name', with: 'Mr Sassy'
  #   fill_in 'Email', with: 'sassy@makers.com'
  #   fill_in 'Password', with: '12345'
  #   click_button 'Sign Up'
  #   expect(page).to have_content('Welcome, Mr Sassy')
  # end
  #
  # scenario 'Users can not sign up twice with same name' do
  #   visit '/'
  #   fill_in 'Name', with: 'Mr Sassy'
  #   fill_in 'Email', with: 'sassy@makers.com'
  #   fill_in 'Password', with: '12345'
  #   click_button 'Sign Up'
  #   visit '/'
  #   fill_in 'Name', with: 'Mr Sassy'
  #   fill_in 'Email', with: 'sassy@makers.com'
  #   fill_in 'Password', with: '12345'
  #   click_button 'Sign Up'
  #   expect(page).to have_content('Sorry, username not available!')
  # end
end
