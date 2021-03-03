# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'User can have line breaks in their message' do
    Capybara.current_driver = :selenium_chrome_headless
    sign_up(email: 'test@email.com', username: 'Troy', password: 'testpass')
    create_a_new_post_and_see_it_on_the_feed("Hello, world!\n This is great!")
    # This should be changed to match the <br> usage
    expect(page).to have_content("Hello, world!\n This is great!")
  end

  Capybara.use_default_driver
  
end
