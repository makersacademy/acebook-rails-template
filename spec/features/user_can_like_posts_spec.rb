# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Like posts', type: :feature do
  scenario 'Like post counter' do
  end

  scenario 'Can unlike post' do
    signup
    create_hello_world_post
    click_button 'Like'
    expect(page).to have_content('1 Like')
    click_button 'Unlike'
    expect(page).to have_content('0 Likes')
  end
end
