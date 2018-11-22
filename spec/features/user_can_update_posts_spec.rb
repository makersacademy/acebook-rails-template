# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Updating Posts', type: :feature do
  scenario 'user can update their own post' do
    login(email: 'test@user.com', password: 'qwerty')
    post_message(message: 'Hello, world!')
    click_link 'Hello, world!'
    click_button 'Edit'
    expect(page).to have_field('Message')
  end


end
