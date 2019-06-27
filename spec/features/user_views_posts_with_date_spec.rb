# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'Can display date with post text' do
    sign_up(username: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    add_post(message: 'Hello, world!')

    time = Post.all[0].updated_at.strftime('%Y-%m-%d, %H:%M')

    expect(page).to have_content('Hello, world!')
    expect(page).to have_content(time)
  end

  scenario 'Can display username with post text' do
    sign_up(username: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    add_post(message: 'Hello, world!')

    expect(page).to have_content('test')
  end
end
