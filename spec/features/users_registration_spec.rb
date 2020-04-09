require 'rails_helper'

RSpec.feature 'Users can sign up', type: :feature do
  scenario 'Can sign up for an account' do
    sign_up
    expect(current_path).to eq ('/')
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
