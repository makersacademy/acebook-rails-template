# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users Wall', type: :feature do
  scenario 'User land on their own wall after signup or login' do
    sign_up(
      username: 'test',
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    user = User.all[0]

    expect(page).to have_current_path("/users/#{user.id}/posts")
  end

  scenario 'User can see their username on their wall when logged in' do
    sign_up(
      username: 'test',
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )

    expect(page).to have_content('Logged in as test')
    expect(page).to have_content('test\'s wall')
  end
end
