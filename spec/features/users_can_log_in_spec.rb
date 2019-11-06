require 'rails_helper'

RSpec.feature 'Log in' do
  scenario 'user signs in' do
    log_in_test_user
    expect(page).to have_content 'Logged in as test@example.com'
  end
end
