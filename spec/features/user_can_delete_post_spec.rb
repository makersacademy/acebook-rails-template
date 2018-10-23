# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Delete posts', type: :feature do
  scenario 'Can delete posts' do
    create_hello_world_post
    click_link 'Delete post'
    expect(page).to_not have_content('Hello, world!')
  end
end
