# frozen_string_literal: true

require 'rails_helper'
require 'feature_test_helpers'

RSpec.feature 'Edit button', type: :feature do
  scenario 'Cannot edit others posts' do
    sign_up
    post_message
    click_link('Logout')
    sign_up_2
    click_link('Edit')
    expect(page).to have_content("You can't edit somebody elses post!")
    expect(current_path).to eq("/posts")
  end
end
