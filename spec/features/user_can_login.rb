require 'rails_helper'
require 'web_helper'

RSpec.feature 'User login', type: :feature do
  before(:each) { 
    visit('/')
    sign_in_flaubert
  }

  scenario 'user can login to existing account' do
    visit '/login'
    fill_in 'user_email', with: 'js@test.com'
    fill_in 'user_password', with: 'foobar'
    click_button 'Submit'
    expect(page).to have_content('Signed in as Flaubert')
  end
end
