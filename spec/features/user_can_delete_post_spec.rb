# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and delete them' do
    sign_up
    create_post
    click_link 'Destroy'
    expect(page).not_to have_content('Hello, world!')
  end
end
