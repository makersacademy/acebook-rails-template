require 'rails_helper'

RSpec.feature 'Log in' do
  scenario 'user signs in' do
    log_in_test_user
    user = User.first
    p user
    expect(page).to have_content 'Logged in as test@example.com'
    expect(current_path).to eq("/#{user.id}")
  end
end
