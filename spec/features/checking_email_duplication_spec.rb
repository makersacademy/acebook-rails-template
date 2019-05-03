# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Unique email signup', type: :feature do
  scenario 'gives error when signing up with an existing email' do
    sign_up_helper('email@duplicate.com', '123456')
    click_button 'Log out'
    sign_up_helper('email@duplicate.com', '123456')
    expect(page).to have_content('This email already registered. Please log in!')
  end
end
