
require 'rails_helper'

RSpec.feature 'Log In', type: :feature do
  scenario 'User can log into acebook' do
    visit '/login'
    expect(page).to have_content('Log in')
  end
end 
