# frozen_string_literal: true

require 'rails_helper'
require 'feature_test_helpers'

RSpec.feature 'Delete button', type: :feature do
  scenario 'Cannot delete others posts' do
    sign_up
    post_message
    click_link('Logout')
    sign_up_2
    click_link('Delete')
    expect(page).to have_content("You must unlearn what you have learned.")
    expect(current_path).to eq('/posts')
  end

  scenario 'Can delete own post' do
    sign_up
    post_message
    expect(page).to have_content('Hello, World!')
    click_link('Delete')
    expect(current_path).to eq('/posts')
    expect(page).not_to have_content('Hello, World!')
  end
end
