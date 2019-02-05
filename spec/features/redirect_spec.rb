require 'rails_helper'
RSpec.feature 'redirect' do
  scenario '' do
    signup_and_click
    logout
    visit '/users/1'
    expect(page.current_path).to eql('/login')
    expect(page).to have_content 'Please log in.'
  end
end
