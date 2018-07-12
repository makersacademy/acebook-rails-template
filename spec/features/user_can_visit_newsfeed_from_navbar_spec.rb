# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "User can navigate to newsfeed from navbar", type: :feature do
  scenario 'successfuly' do
    sign_up_successfully

    click_link 'View profile'
    click_link 'petBook'
    expect(page).to have_content("What's on your mind?")
  end
end
