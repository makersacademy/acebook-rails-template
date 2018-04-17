# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Commenting on posts', type: :feature do
  include ActiveSupport::Testing::TimeHelpers
  before(:each) do
    sign_up
    add_new_post
    travel_to Time.zone.local(1991, 5, 27, 00, 00, 00)
    add_comment
  end

  scenario 'users can submit comments on posts' do
    expect(page).to have_content('Rails is awesome!')
  end

  scenario 'each comment shows a creation timestamp' do
    expect(page).to have_content "1991-05-27 01:00:00"
  end

  # UNCOMMENT WHEN NEED TO TEST COMMENTS LIKING
  # scenario 'users can like comments' do
  #   click_link('like_comment')
  #   expect(page).to have_content 'Comment Like 1'
  # end
  #
  # scenario 'users can unlike a comment they already liked' do
  #   click_link('like_comment')
  #   expect(page).to have_content 'Comment Like 0'
  # end
end
