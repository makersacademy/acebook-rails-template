require 'rails_helper'

RSpec.feature 'Log in', type: :feature do
  scenario 'Signup form should have link to log in page' do
    visit '/'
    expect(page).to have_link("Click here to log in.")
  end
end