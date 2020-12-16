require 'rails_helper'

RSpec.feature 'User can delete account', type: :feature do
  scenario 'Can delete their account on SCZL' do
    register
    click_link 'User Settings'
    click_button 'Delete my account'
    expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.')
  end
end
