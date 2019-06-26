# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Unlike', type: :feature do
  scenario 'Can unlike a post' do
    sign_up(user_name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    add_post(message: 'Hello, world!')

    click_button Emoji.find_by_alias('thumbsup').raw
    click_button Emoji.find_by_alias('thumbsdown').raw

    expect(page).to have_content('0 Likes')
    expect(page).to have_content(:thumbsup)
  end
end
