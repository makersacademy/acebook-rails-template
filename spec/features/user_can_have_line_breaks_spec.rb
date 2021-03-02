# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'User can have line breaks in their message' do
    sign_up(email: 'test@email.com', password: 'testpass')
    create_a_new_post_and_see_it_on_the_feed("Hello, world!\n This is great!")
    expect(page).to have_content("Hello, world!\n This is great!")
  end
end