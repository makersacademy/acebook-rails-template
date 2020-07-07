# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'friendslist', type: :feature do
  scenario 'Can view friends page' do
    visit '/signup'
    fill_in 'user[name]', with: 'Emanuele'
    fill_in 'user[email]', with: 'ema@test.com'
    fill_in 'user[password]', with: '12345'
    click_on 'Create Account'
    click_link 'Emanuele'
    expect(page).to have_content("Profile Page")
  end
end
