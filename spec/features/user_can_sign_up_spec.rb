require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  scenario 'Can see sign up page' do
  visit '/users/new'
  expect(current_path).to eq('/users/new')
  expect(page).to have_content('Name')
  expect(page).to have_content('Email')
  expect(page).to have_content('Password')
  end
end
