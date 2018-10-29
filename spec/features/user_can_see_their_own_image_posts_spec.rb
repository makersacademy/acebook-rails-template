# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    signup
    upload_image
    visit '/my_images'
    expect(page).to have_content('my logo')
  end
end
