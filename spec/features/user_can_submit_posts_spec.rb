# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    sign_up
    add_new_post
    expect(page).to have_content('Hello, world!')
  end
end

RSpec.feature 'Links', type: :feature do
  scenario 'Redirected to the Posts page when you click on the link' do
    visit '/'
    click_link 'Go to Posts page'
    expect(page).to have_content('News Deck')
  end
end
