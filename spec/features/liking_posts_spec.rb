# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Liking Posts' do
  scenario 'Can like a post and see like count' do
    # Arrange
    sign_up
    add_new_post
    # Action
    within("div.post_options_div") do
      find('div#like_count').click_on('Like')
    end
    # Assert
    expect(page).to have_content('Likes: 1')
  end

  scenario 'Users can like a post only once' do
    # Arrange
    sign_up
    add_new_post
    # Action
    within("div.post_options_div") do
      find('div#like_count').click_on('Like')
      find('div#like_count').click_on('Like')
    end
    # Assert
    expect(page).to have_content 'Likes: 0'
  end
end
