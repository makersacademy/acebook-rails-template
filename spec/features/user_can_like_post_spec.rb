# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Likes', type: :feature do
  scenario "Can see the 'like' emoji next to a post" do
    sign_up(username: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    add_post(message: 'Hello, world!')

    expect(page).to have_content(:thumbsup)
  end

  scenario 'Can click the like emoji' do
    sign_up(username: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    add_post(message: 'Hello, world!')

    click_button Emoji.find_by_alias('thumbsup').raw

    expect(page).to have_content('1 Like')
    expect(page).to have_content(:thumbsdown)
  end
end
