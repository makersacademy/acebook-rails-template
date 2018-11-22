# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Updating Posts', type: :feature do
  scenario 'user can update their own post' do
    login(email: 'test@user.com', password: 'qwerty')
    post_message(message: 'Hello, world!')
    click_link 'Hello, world!'
    click_button 'Edit'
    fill_in('Message', with: 'Goodbye, world!')
    click_button 'Submit'
    expect(page).to have_content('Goodbye, world!')
    expect(page).not_to have_content('Hello, world!')
  end


end
