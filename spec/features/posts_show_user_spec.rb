# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts to show user name', type: :feature do
  scenario 'all posts will show user name ' do
    create_user
    click_link 'New post'
    fill_in 'Message', with: 'Testing User name'
    click_button 'Post'
    test_username = 'Kate'

    expect(page).to have_content(test_username)
  end
end
