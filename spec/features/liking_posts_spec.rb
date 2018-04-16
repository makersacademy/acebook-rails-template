# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Liking Posts' do
  scenario 'Users can like a post only once', type: :feature do
    sign_up
    add_new_post
    click_button('Show')
    click_link('Like')
    click_link('Like')
    expect(page).to have_content 'Like 0'
    expect(page).not_to have_content 'Like 1'
  end

  scenario 'Can like a post and see like count', type: :feature do
    # Arrange
    sign_up
    add_new_post
    # Action
    click_button('Show')
    click_link('Like')
    # Assert
    expect(page).to have_content('Like 1')
  end
end
