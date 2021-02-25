# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'User can delete a former post' do
    create_a_new_post_and_see_it_on_the_feed("Hello, world!")
    first('.post').click_link 'Delete'
    expect(page).not_to have_content('Hello, world!')
  end
end