# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'Users are able to delete their own posts' do
    sign_up(
      username: 'test',
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    click_link 'Sign out'
    sign_in_and_add_post(message: 'Post number one')
    add_post(message: 'This is the second post')

    first(:button, 'Delete').click

    expect(page).to have_content('Post number one')
    expect(page).not_to have_content('This is the second post')
  end
end
