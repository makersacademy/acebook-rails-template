# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts to show date', type: :feature do
  scenario 'all posts will show date of entry ' do
    create_user
    click_link 'New post'
    fill_in 'Message', with: 'Testing Date'
    click_button 'Post'
    expect(page).to have_content(Time.now.strftime('%B %Y'))
  end
end
