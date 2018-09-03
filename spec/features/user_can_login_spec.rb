# frozen_string_literal: true

require 'rails_helper'
require 'features/web_helper'

RSpec.feature 'User login', type: :feature do
  before(:each) { 
    visit '/users/sign_up'
    sign_up_jackbert
  }
  
  scenario 'user can login to existing account' do
    sign_out :user
    visit '/users/sign_in'
    fill_in 'Email', with: 'js@test.com'
    fill_in 'Password', with: 'foobar'
    click_button 'Log in'
    expect(page).to have_content('Logged in as Jack')
  end
end
