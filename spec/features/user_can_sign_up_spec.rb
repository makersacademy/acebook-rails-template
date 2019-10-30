# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  scenario 'Can sign up and log in' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'leo@kilo.com'
    fill_in 'Password', with: 'qwerty'
    fill_in 'Password confirmation', with: 'qwerty'
    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
