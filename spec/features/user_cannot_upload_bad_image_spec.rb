# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    signup
    visit '/image_posts/new'
    fill_in 'Caption', with: 'my logo'
    click_button('Create Image post')
    visit '/my_images'
    expect(page).to have_content('my logo')
  end
end
