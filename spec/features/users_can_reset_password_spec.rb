require 'rails_helper'
require 'helpers/users_helper_spec'

RSpec.feature 'Timeline', type: :feature do
  scenario 'User can request to reset password' do
    first_user
    click_link 'Forgot your password?'
    expect(page).to have_selector(:link_or_button, 'Send me reset password instructions')
  end
end
